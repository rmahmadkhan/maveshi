import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/login/components/social_login_section.dart';
import 'package:maveshi/ui/screens/register/components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              const MyText('Let’s get started!',
                  fontSize: 30, fontWeight: FontWeight.bold),
              const VerticalSpacing(of: 10),
              const MyText(
                'Please register to continue',
                fontSize: 20,
                color: AppTheme.greyColor,
              ),
              const VerticalSpacing(of: 50),
              const RegisterForm(),
              const VerticalSpacing(of: 10),
              Align(
                alignment: Alignment.center,
                child: MyTextButton(
                  onTap: (_) =>
                      Navigator.pushNamed(context, LoginScreen.routeName),
                  prefixText: 'Already have an account?',
                  title: 'Login',
                ),
              ),
              const SocialLoginSection(),
            ],
          ),
        ),
      ),
    );
  }
}
