import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/add_animal/components/date_picker.dart';
import 'package:maveshi/ui/screens/animal_details/components/time_picker.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({Key? key}) : super(key: key);

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final eventNameController = TextEditingController();
  DateTime eventDate = DateTime.now();
  void onDateChangeCallback(DateTime date) => setState(() => eventDate = date);
  TimeOfDay eventTime = TimeOfDay.now();
  void onTimeChangeCallback(TimeOfDay time) => setState(() => eventTime = time);
  final eventSupervisorController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void dispose() {
    eventNameController.dispose();
    eventSupervisorController.dispose();
    notesController.dispose();
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
              const MyText('Add Event',
                  fontSize: 24, fontWeight: FontWeight.bold),
              const VerticalSpacing(),
              MyTextField(
                controller: eventNameController,
                caption: 'Event Name',
                hintText: 'Medication',
              ),
              const VerticalSpacing(of: 10),
              Row(
                children: [
                  Expanded(
                    child: DatePicker(
                      onChanged: onDateChangeCallback,
                      caption: 'Date',
                    ),
                  ),
                  const HorizontalSpacing(),
                  Expanded(
                    child: TimePicker(
                      onChanged: onTimeChangeCallback,
                      caption: 'Time',
                    ),
                  ),
                ],
              ),
              const VerticalSpacing(of: 10),
              MyTextField(
                controller: eventSupervisorController,
                caption: 'Event Supervisor',
              ),
              const VerticalSpacing(of: 10),
              MyTextField(
                controller: notesController,
                caption: 'Notes',
                maxLines: 4,
              ),
              const VerticalSpacing(),
              MyElevatedButton('Add Event', onTap: (_) {}),
            ],
          ),
        ),
      ),
    );
  }
}
