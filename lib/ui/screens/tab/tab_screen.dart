import 'package:firebase_auth/firebase_auth.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/tab/components/bottom_nav_bar.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = '/TabScreen';

  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  final List<Widget> tabWidgets = [
    const HomeScreen(),
    const MilkReportScreen(),
    const SettingsScreen(),
  ];

  final List<String> appBarTitles = [
    'MAVESHI',
    'Milk Report',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: _selectedIndex != 0,
        title: MyText(appBarTitles[_selectedIndex], fontSize: 20),
        backgroundColor: AppTheme.whiteColor,
        iconTheme: const IconThemeData(color: AppTheme.navyBlueColor),
        actions: _selectedIndex == 2
            ? [
                IconButton(
                  onPressed: _onTapLogout,
                  icon: const Icon(Icons.logout),
                ),
              ]
            : null,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: tabWidgets,
      ),
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  void _onTapLogout() async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const MyText(
          'Do you want to logout?',
          fontWeight: FontWeight.bold,
        ),
        actions: [
          TextButton(
              onPressed: () async {
                EasyLoading.show();
                await FirebaseAuth.instance.signOut();
                prefs.removeUser();
                prefs.removeFarm();
                EasyLoading.dismiss();

                if (!mounted) return;
                Navigator.popUntil(context, (route) => false);
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: const MyText('Logout', color: AppTheme.orangeColor)),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const MyText('Cancel')),
        ],
      ),
    );
  }
}
