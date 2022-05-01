import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(controller: nameController, hintText: 'Name'),
        const VerticalSpacing(),
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
        const VerticalSpacing(),
        MyTextField(
          controller: confirmPasswordController,
          hintText: 'Confirm Password',
          obscure: true,
        ),
        const VerticalSpacing(),
        MyElevatedButton(
          'Register',
          onTap: (_) => Navigator.pushNamed(context, SetupFarmScreen.routeName),
        ),
      ],
    );
  }
}
