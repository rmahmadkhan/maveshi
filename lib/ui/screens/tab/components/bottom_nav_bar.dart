import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/tab/components/custom_icon_button.dart';

class BottomNavBar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;

  const BottomNavBar({
    required this.onItemTapped,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomIconButton(
            icon: Icons.holiday_village,
            onTap: (_) => onItemTapped(0),
            color:
                selectedIndex == 0 ? AppTheme.orangeColor : AppTheme.greyColor,
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.cow,
            onTap: (_) => onItemTapped(1),
            color:
                selectedIndex == 1 ? AppTheme.orangeColor : AppTheme.greyColor,
          ),
          CustomIconButton(
            icon: Icons.query_stats,
            onTap: (_) => onItemTapped(2),
            color:
                selectedIndex == 2 ? AppTheme.orangeColor : AppTheme.greyColor,
          ),
          CustomIconButton(
            icon: Icons.settings,
            onTap: (_) => onItemTapped(3),
            color:
                selectedIndex == 3 ? AppTheme.orangeColor : AppTheme.greyColor,
          )
        ],
      ),
    );
  }
}
