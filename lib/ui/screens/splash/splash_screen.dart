import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/splash/components/loading_data.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyText('MAVESHI', fontSize: 30, fontWeight: FontWeight.bold),
            VerticalSpacing(of: 40),
            LoadingDataWidget(),
          ],
        ),
      ),
    );
  }
}
