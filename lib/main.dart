import 'package:firebase_core/firebase_core.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/firebase_options.dart';
import 'package:maveshi/locator.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DependencyInjectionEnvironment.setup();

  runApp(const MaveshiApp());
}

class MaveshiApp extends StatelessWidget {
  const MaveshiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 480,
          minWidth: 380,
          defaultScale: true,
          breakpoints: const [ResponsiveBreakpoint.autoScale(380)],
          background: Container(color: const Color(0xFFF5F5F5)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Maveshi',
      themeMode: ThemeMode.light,
      theme: AppTheme.buildTheme(),
      routes: routes,
      initialRoute: LoginScreen.routeName,
    );
  }
}
