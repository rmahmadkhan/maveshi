import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/register/components/setup_farm_dialog.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapGoogle(context),
      child: SizedBox(
        height: 60,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 2,
          shadowColor: AppTheme.lightNavyBlueColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
                child: Image.asset('assets/icons/google.png'),
              ),
              const HorizontalSpacing(),
              const MyText('Continue with Google', fontSize: 16),
            ],
          ),
        ),
      ),
    );
  }

  static void _onTapGoogle(BuildContext context) async {
    try {
      final googleSignIn = GoogleSignIn();
      EasyLoading.show();

      await googleSignIn.signOut();
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        EasyLoading.dismiss();
        EasyLoading.showError('Unable to sign in with Google.');
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final dbUser = await userRepository.get(googleUser.email);

      if (dbUser == null) {
        final newUser = LocalUser(
          name: googleUser.displayName,
          email: googleUser.email,
          imagePath: googleUser.photoUrl,
        );
        await userRepository.add(newUser);
        await prefs.setUser(newUser);
        EasyLoading.dismiss();

        showDialog(context: context, builder: (_) => const SetupFarmDialog());
      } else {
        await prefs.setUser(dbUser);
        await context
            .read<FarmProvider>()
            .fetchFarmFromDatabase(dbUser.farmId!);
        EasyLoading.dismiss();

        Navigator.popUntil(context, (route) => false);
        Navigator.pushNamed(context, TabScreen.routeName);
      }
    } on Exception catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
