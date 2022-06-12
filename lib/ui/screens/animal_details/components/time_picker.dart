import 'package:intl/intl.dart';
import 'package:maveshi/all_utils.dart';

class TimePicker extends StatefulWidget {
  final Function(TimeOfDay) onChanged;
  final String caption;

  const TimePicker({required this.onChanged, required this.caption, Key? key})
      : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          widget.caption,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppTheme.navyBlueColor,
        ),
        const VerticalSpacing(of: 10),
        GestureDetector(
          onTap: () => _selectTime(context),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    style: BorderStyle.solid, color: AppTheme.navyBlueColor)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyText(
                      DateFormat.jm().format(DateTime(today.year, today.month,
                          today.day, selectedTime.hour, selectedTime.minute)),
                      color: AppTheme.navyBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    const Icon(Icons.schedule,
                        color: AppTheme.lightNavyBlueColor),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() => selectedTime = selected);
      widget.onChanged.call(selectedTime);
    }
  }
}
