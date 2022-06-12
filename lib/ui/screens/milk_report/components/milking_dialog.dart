import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/add_animal/components/date_picker.dart';

class MilkingDialog extends StatefulWidget {
  const MilkingDialog({Key? key}) : super(key: key);

  @override
  State<MilkingDialog> createState() => _MilkingDialogState();
}

class _MilkingDialogState extends State<MilkingDialog> {
  DateTime milkingDate = DateTime.now();
  void onDateChangeCallback(DateTime date) =>
      setState(() => milkingDate = date);
  final litersController = TextEditingController();

  @override
  void dispose() {
    litersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.whiteColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const MyText('Add Milking',
                  fontSize: 24, fontWeight: FontWeight.bold),
              const VerticalSpacing(),
              DatePicker(
                onChanged: onDateChangeCallback,
                caption: 'Date',
              ),
              const VerticalSpacing(of: 10),
              MyTextField(
                controller: litersController,
                caption: 'Milk',
                hintText: '1.5',
                keyboardType: TextInputType.number,
                suffixWidget: const MyText(
                  'Liter',
                  color: AppTheme.lightNavyBlueColor,
                ),
              ),
              const VerticalSpacing(),
              MyElevatedButton('Add', onTap: _onTapAdd),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapAdd(BuildContext context) async {
    final liters = double.tryParse(litersController.text.trim());

    if (liters == null) {
      EasyLoading.showError('Enter valid data!');
    } else {
      EasyLoading.show();
      final milking = Milk(dateTime: milkingDate, liters: liters);
      await context.read<FarmProvider>().addMilking(milking);
      EasyLoading.dismiss();

      if (!mounted) return;
      Navigator.pop(context);
    }
  }
}
