import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/forgot_password/components/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/ForgotPasswordScreen';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyText('Forgot Password?',
                fontSize: 30, fontWeight: FontWeight.bold),
            VerticalSpacing(of: 10),
            MyText(
              'We\'ll be sending you details to reset your password',
              fontSize: 20,
              color: AppTheme.greyColor,
            ),
            VerticalSpacing(of: 50),
            ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}
