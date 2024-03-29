import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';

class SetupFarmDialog extends StatefulWidget {
  const SetupFarmDialog({Key? key}) : super(key: key);

  @override
  State<SetupFarmDialog> createState() => _SetupFarmDialogState();
}

class _SetupFarmDialogState extends State<SetupFarmDialog> {
  final nameController = TextEditingController();
  final currencyController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    currencyController.dispose();
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
              const VerticalSpacing(of: 10),
              MyDropdown(
                controller: currencyController,
                list: const ['\$', '£', 'Rs', '€', '﷼', '₹'],
                hint: 'Select Currency',
              ),
              const VerticalSpacing(),
              MyElevatedButton('Update', onTap: onTapUpdate),
            ],
          ),
        ),
      ),
    );
  }

  void onTapUpdate(BuildContext context) async {
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
      await userRepository.update(user.email, {'farmId': farmId});
      await prefs.setUser(updatedUser);

      final farm = Farm(
        id: farmId,
        name: farmName,
        currency: currencyController.text,
        owner: user.email,
        animals: [],
        milkingDetails: [],
      );
      await farmRepository.add(farm);
      await prefs.setFarm(farm);

      EasyLoading.dismiss();
      if (!mounted) return;
      Navigator.popUntil(context, (route) => false);
      Navigator.pushNamed(context, TabScreen.routeName);
    }
  }
}
