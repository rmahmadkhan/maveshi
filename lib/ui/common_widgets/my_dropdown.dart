import 'package:maveshi/all_utils.dart';

class MyDropdown extends StatefulWidget {
  final TextEditingController controller;
  final List<String> list;
  final String hint;

  const MyDropdown({
    required this.controller,
    required this.list,
    required this.hint,
    Key? key,
  }) : super(key: key);

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(style: BorderStyle.solid, color: AppTheme.navyBlueColor),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 0.0,
                  isExpanded: true,
                  value: _selectedValue,
                  items:
                      widget.list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: MyText(value),
                    );
                  }).toList(),
                  hint: MyText(
                    widget.hint,
                    fontSize: 15,
                    color: AppTheme.lightNavyBlueColor,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value;
                      widget.controller.text = value ?? '';
                    });
                  },
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 12),
          ],
        ),
      )),
    );
  }
}
