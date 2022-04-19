import 'package:maveshi/all_utils.dart';

class MyTextButton extends StatelessWidget {
  final Function(BuildContext context) onTap;
  final String title;
  final Color titleColor;
  final double fontSize;
  final String prefixText;
  final Color prefixTextColor;

  const MyTextButton({
    required this.onTap,
    required this.title,
    this.titleColor = AppTheme.orangeColor,
    this.fontSize = 16,
    this.prefixText = '',
    this.prefixTextColor = AppTheme.greyColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(prefixText, color: prefixTextColor, fontSize: fontSize),
        TextButton(
          onPressed: () => onTap(context),
          child: MyText(title, color: titleColor, fontSize: fontSize),
        ),
      ],
    );
  }
}
