import 'package:maveshi/all_utils.dart';

class MyElevatedButton extends StatelessWidget {
  final Function(BuildContext context) onTap;
  final String title;
  final Color color;
  final double width;
  final double height;
  final Color titleColor;
  final EdgeInsetsGeometry margin;

  const MyElevatedButton(
    this.title, {
    required this.onTap,
    this.titleColor = AppTheme.whiteColor,
    this.width = double.infinity,
    this.height = 48,
    this.color = AppTheme.orangeColor,
    this.margin = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: MyText(
              title,
              color: titleColor,
              fontSize: height / 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => onTap(context),
        ),
      ),
    );
  }
}
