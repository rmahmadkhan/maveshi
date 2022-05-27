import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/tab/components/bottom_nav_bar.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = '/TabScreen';

  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  final List<Widget> tabWidgets = [
    const HomeScreen(),
    const MilkReportScreen(),
    const FinanceReportScreen(),
    const SettingsScreen(),
  ];

  final List<String> appBarTitles = [
    'MAVESHI',
    'Milk Report',
    'Finance Report',
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
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: tabWidgets,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);
}
