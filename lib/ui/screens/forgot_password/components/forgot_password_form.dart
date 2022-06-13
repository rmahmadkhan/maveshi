import 'package:firebase_auth/firebase_auth.dart';
import 'package:maveshi/all_utils.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          controller: emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const VerticalSpacing(),
        MyElevatedButton('Next', onTap: _onTapNext),
      ],
    );
  }

  void _onTapNext(BuildContext context) async {
    if (emailController.text.contains('@') == false) {
      EasyLoading.showError('Enter a valid email.');
      return;
    }

    final email = emailController.text.toString().trim();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.toString());
      return;
    }

    if (!mounted) return;
    Navigator.pop(context);

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const MyText('Password Reset', fontSize: 22),
        content: MyText(
          'We have sent you password reset instructions on $email',
          fontSize: 16,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const MyText('Okay', color: AppTheme.orangeColor),
          ),
        ],
      ),
    );
  }
}
