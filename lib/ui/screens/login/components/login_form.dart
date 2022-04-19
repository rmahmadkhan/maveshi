import 'package:maveshi/all_utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
        MyTextField(
          controller: passwordController,
          hintText: 'Password',
          obscure: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MyTextButton(onTap: (_) {}, title: 'Forgot Password?'),
        ),
        MyElevatedButton('Login', onTap: (_) {}),
      ],
    );
  }
}
