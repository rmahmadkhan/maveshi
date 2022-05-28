import 'package:maveshi/all_utils.dart';
import 'package:maveshi/models/enums/gender.dart';

class MyRadioButtonTile extends StatefulWidget {
  final Gender value;
  final Gender groupValue;
  final Function(Gender?) onChanged;

  const MyRadioButtonTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<MyRadioButtonTile> createState() => _MyRadioButtonTileState();
}

class _MyRadioButtonTileState extends State<MyRadioButtonTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppTheme.navyBlueColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            widget.value.value,
            color: AppTheme.navyBlueColor,
            fontSize: 18,
          ),
          Radio<Gender>(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
            activeColor: AppTheme.orangeColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
