import 'package:firebase_core/firebase_core.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaveshiApp());
}

class MaveshiApp extends StatelessWidget {
  const MaveshiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maveshi',
      themeMode: ThemeMode.light,
      theme: AppTheme.buildTheme(),
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
