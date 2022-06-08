import 'package:firebase_auth/firebase_auth.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/locator.dart';
import 'package:maveshi/ui/screens/register/components/setup_farm_dialog.dart';

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
        MyElevatedButton('Register', onTap: _onTapRegisterButton),
      ],
    );
  }

  void _onTapRegisterButton(BuildContext context) async {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();

    if (emailController.text.contains('@') == false) {
      EasyLoading.showError('Enter a valid email.');
    } else if (passwordController.text.isEmpty ||
        passwordController.text != confirmPasswordController.text) {
      EasyLoading.showError('Passwords do no match.');
    } else {
      try {
        EasyLoading.show();
        final auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text);

        final User? user = auth.currentUser;
        if (user != null) {
          // if (!user.emailVerified) {
          //   user.sendEmailVerification();
          // }
          // final fcmToken = await FirebaseMessaging.instance.getToken();
          final localUser = LocalUser(
            name: nameController.text,
            email: emailController.text,
          );
          userRepository.add(localUser);
          prefs.setUser(localUser);

          EasyLoading.dismiss();

          showDialog(
            context: context,
            builder: (_) => const SetupFarmDialog(),
            barrierDismissible: false,
          );
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError('Could not register, please try again.');
        }
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();
        if (e.code == 'weak-password') {
          EasyLoading.showError('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          EasyLoading.showError('The account already exists for that email.');
        } else {
          EasyLoading.showError('Something bad occurred.\n$e');
        }
      }
    }
  }
}
