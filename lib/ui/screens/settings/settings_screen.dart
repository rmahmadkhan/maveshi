import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/settings/components/edit_profile_picture.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/SettingsScreen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _nameController = TextEditingController();
  final _farmNameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    _nameController.dispose();
    _farmNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = prefs.user;
    _nameController.text = user?.name ?? '';
    _farmNameController.text = prefs.farm?.name ?? '';
    final email = user?.email ?? 'N/A';

    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            EditProfilePicture(
                imagePath: user?.imagePath,
                onChanged: editProfilePictureCallback),
            const VerticalSpacing(),
            MyText(
              email,
              fontSize: 17,
              color: AppTheme.lightNavyBlueColor,
            ),
            const VerticalSpacing(of: 30),
            MyTextField(controller: _nameController, caption: 'Name'),
            const VerticalSpacing(of: 10),
            MyTextField(
              controller: _farmNameController,
              caption: 'Farm Name',
            ),
            const VerticalSpacing(of: 30),
            MyElevatedButton(
              'Update',
              onTap: _onTapUpdateButton,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  void editProfilePictureCallback(File file) => image = file;

  Future<String?> _uploadFile(String id) async {
    if (image != null) {
      final imageFile = FirebaseStorage.instance.ref().child(
            'users/$id/profilePicture.jpg',
          );
      final snapshot = await imageFile.putFile(image!);
      final url = await snapshot.ref.getDownloadURL();
      return url;
    }
    return null;
  }

  void _onTapUpdateButton(BuildContext context) async {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();

    final user = prefs.user;
    if (user?.email == null) {
      EasyLoading.showError('No account logged in');
      return null;
    }

    EasyLoading.show();
    final imagePath = await _uploadFile(user!.email);
    final localUser = LocalUser(
      name: _nameController.text,
      email: user.email,
      imagePath: imagePath ?? user.imagePath,
      farmId: user.farmId,
    );
    await userRepository.add(localUser);
    await prefs.setUser(localUser);
    if (!mounted) return;
    await context.read<FarmProvider>().updateFarmName(_farmNameController.text);

    EasyLoading.dismiss();
    EasyLoading.showSuccess('Profile updated successfully!');
  }
}
