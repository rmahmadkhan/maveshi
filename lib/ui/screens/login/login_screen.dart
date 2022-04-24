import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/login/components/login_form.dart';
import 'package:maveshi/ui/screens/login/components/social_login_section.dart';
import 'package:maveshi/ui/screens/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              const MyText('Welcome',
                  fontSize: 30, fontWeight: FontWeight.bold),
              const VerticalSpacing(of: 10),
              const MyText(
                'Please login to continue',
                fontSize: 20,
                color: AppTheme.greyColor,
              ),
              const VerticalSpacing(of: 50),
              const LoginForm(),
              const VerticalSpacing(of: 10),
              Align(
                alignment: Alignment.center,
                child: MyTextButton(
                  onTap: (_) =>
                      Navigator.pushNamed(context, RegisterScreen.routeName),
                  prefixText: 'New to the app?',
                  title: 'Register',
                ),
              ),
              const VerticalSpacing(),
              const SocialLoginSection(),
            ],
          ),
        ),
      ),
    );
  }
}
