import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';

class HomeHawkFABMenu extends StatelessWidget {
  final Widget body;
  const HomeHawkFABMenu({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HawkFabMenu(
      openIcon: Icons.add,
      closeIcon: Icons.close,
      fabColor: AppTheme.orangeColor,
      iconColor: AppTheme.whiteColor,
      items: [
        HawkFabMenuItem(
          label: 'Add Animal',
          ontap: () => Navigator.pushNamed(context, AddAnimalScreen.routeName),
          icon: const Icon(Icons.pets),
          color: AppTheme.camelColor,
          labelColor: AppTheme.navyBlueColor,
        ),
      ],
      body: body,
    );
  }
}
