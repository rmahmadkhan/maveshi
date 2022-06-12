import 'package:firebase_auth/firebase_auth.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/register/components/setup_farm_dialog.dart';

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
          child: MyTextButton(
            onTap: (_) =>
                Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
            title: 'Forgot Password?',
          ),
        ),
        MyElevatedButton('Login', onTap: _onTapLogin),
      ],
    );
  }

  void _onTapLogin(BuildContext context) async {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();

    if (emailController.text.contains('@') == false) {
      EasyLoading.showError('Enter a valid email');
      return;
    }

    try {
      EasyLoading.show();
      final userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text);

      final email = userCredentials.user?.email;
      if (email != null) {
        final user = await userRepository.get(email);
        if (user != null) {
          await prefs.setUser(user);
          EasyLoading.dismiss();

          if (user.farmId == null) {
            showDialog(
                context: context, builder: (_) => const SetupFarmDialog());
          } else {
            if (!mounted) return;
            EasyLoading.show();
            await context
                .read<FarmProvider>()
                .fetchFarmFromDatabase(user.farmId!);
            EasyLoading.dismiss();

            if (!mounted) return;
            Navigator.popUntil(context, (route) => false);
            Navigator.pushNamed(context, TabScreen.routeName);
          }
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError('No user found for that email.');
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        EasyLoading.showError('No user found for that email. Register now!');
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError('Wrong password!');
      } else {
        EasyLoading.showError('Something bad occurred.\n$e');
      }
    }
  }
}
