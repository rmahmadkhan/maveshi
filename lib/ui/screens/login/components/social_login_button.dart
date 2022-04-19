import 'package:maveshi/all_utils.dart';

class SocialLoginButton extends StatelessWidget {
  final String imageName;
  final Function(BuildContext context) onTap;

  const SocialLoginButton({
    Key? key,
    required this.imageName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: SizedBox(
        width: 100,
        height: 60,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          shadowColor: AppTheme.lightNavyBlueColor,
          child: Center(
            child: SizedBox(
              height: 25,
              child: Image.asset('assets/icons/$imageName.png'),
            ),
          ),
        ),
      ),
    );
  }
}
