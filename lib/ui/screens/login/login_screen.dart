import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/login/components/login_form.dart';
import 'package:maveshi/ui/screens/login/components/social_login_section.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            const MyText('Welcome', fontSize: 30, fontWeight: FontWeight.bold),
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
                onTap: (_) {},
                prefixText: 'New to the app?',
                title: 'Register',
              ),
            ),
            const VerticalSpacing(),
            const SocialLoginSection(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
