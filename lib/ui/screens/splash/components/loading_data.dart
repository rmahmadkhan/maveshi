import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';

class LoadingDataWidget extends StatefulWidget {
  const LoadingDataWidget({Key? key}) : super(key: key);

  @override
  State<LoadingDataWidget> createState() => _LoadingDataWidgetState();
}

class _LoadingDataWidgetState extends State<LoadingDataWidget> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen(context);
  }

  void _moveToNextScreen(BuildContext context) async {
    final user = prefs.user;
    if (user == null) {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else {
      await context.read<FarmProvider>().fetchFarmFromDatabase(user.farmId!);
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, TabScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: const [
          VerticalSpacing(of: 10),
          LinearProgressIndicator(backgroundColor: AppTheme.lightNavyBlueColor),
        ],
      ),
    );
  }
}
