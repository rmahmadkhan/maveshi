import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';

class SetupFarmDialog extends StatefulWidget {
  const SetupFarmDialog({Key? key}) : super(key: key);

  @override
  State<SetupFarmDialog> createState() => _SetupFarmDialogState();
}

class _SetupFarmDialogState extends State<SetupFarmDialog> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.whiteColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const MyText(
                'Setup your farm!',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              const VerticalSpacing(of: 10),
              const MyText(
                'Add details about your farm',
                fontSize: 20,
                color: AppTheme.greyColor,
              ),
              const VerticalSpacing(),
              MyTextField(controller: nameController, hintText: 'Farm Name'),
              const VerticalSpacing(),
              MyElevatedButton('Update', onTap: onTapUpdate),
            ],
          ),
        ),
      ),
    );
  }

  void onTapUpdate(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();

    final farmName = nameController.text.trim();
    if (farmName.isEmpty) {
      EasyLoading.showError('Please enter a farm name.');
    } else {
      EasyLoading.show();

      final user = prefs.user;
      final farmId = '$farmName-${user!.email}';
      final updatedUser = LocalUser(
        email: user.email,
        name: user.name,
        farmId: farmId,
      );
      userRepository.update(user.email, {'farmId': farmId});
      prefs.setUser(updatedUser);

      EasyLoading.dismiss();
      Navigator.popUntil(context, (route) => false);
      Navigator.pushNamed(context, TabScreen.routeName);
    }
  }
}
