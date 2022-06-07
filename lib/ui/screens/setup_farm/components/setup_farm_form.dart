import 'package:maveshi/all_utils.dart';

class SetupFarmForm extends StatefulWidget {
  const SetupFarmForm({Key? key}) : super(key: key);

  @override
  State<SetupFarmForm> createState() => _SetupFarmFormState();
}

class _SetupFarmFormState extends State<SetupFarmForm> {
  final nameController = TextEditingController();
  final currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(controller: nameController, hintText: 'Farm Name'),
        const VerticalSpacing(),
        MyDropdown(
          controller: currencyController,
          list: const ['USD', 'PKR', 'AED'],
          hint: 'Select currency',
        ),
        const VerticalSpacing(),
        MyElevatedButton(
          'Finish',
          onTap: (_) {},
        ),
      ],
    );
  }
}
