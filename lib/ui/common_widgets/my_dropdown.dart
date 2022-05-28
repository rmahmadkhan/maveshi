import 'package:maveshi/all_utils.dart';

class MyDropdown extends StatefulWidget {
  final TextEditingController controller;
  final List<String> list;
  final String hint;
  final String? caption;

  const MyDropdown({
    required this.controller,
    required this.list,
    required this.hint,
    this.caption,
    Key? key,
  }) : super(key: key);

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty) {
      _selectedValue = widget.controller.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dropdown = Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
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
                      child: MyText(
                        value,
                        color: AppTheme.navyBlueColor,
                        fontSize: 16,
                      ),
                    );
                  }).toList(),
                  hint: MyText(
                    widget.hint,
                    fontSize: 16,
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

    if (widget.caption != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            widget.caption!,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.navyBlueColor,
          ),
          const VerticalSpacing(of: 10),
          dropdown,
        ],
      );
    } else {
      return dropdown;
    }
  }
}
