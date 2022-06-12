import 'package:maveshi/all_utils.dart';

class ToggleContainer extends StatelessWidget {
  final String title;
  final bool isSelected;
  final BorderRadius? borderRadius;

  const ToggleContainer({
    required this.title,
    required this.isSelected,
    required this.borderRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.camelColor : AppTheme.whiteColor,
        border: Border.all(color: AppTheme.camelColor),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: MyText(
          title,
          fontSize: 16,
          color: isSelected ? AppTheme.whiteColor : AppTheme.camelColor,
        ),
      ),
    );
  }
}
