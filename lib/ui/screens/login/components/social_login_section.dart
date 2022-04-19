import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/login/components/social_login_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(child: Divider(height: 1, color: AppTheme.navyBlueColor)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: MyText(
                'or continue with',
                color: AppTheme.greyColor,
                fontSize: 16,
              ),
            ),
            Expanded(child: Divider(height: 1, color: AppTheme.navyBlueColor)),
          ],
        ),
        const VerticalSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SocialLoginButton(imageName: 'google', onTap: _onTapGoogle),
            SocialLoginButton(imageName: 'facebook', onTap: _onTapFacebook),
            SocialLoginButton(imageName: 'apple', onTap: _onTapApple),
          ],
        ),
      ],
    );
  }

  static void _onTapGoogle(BuildContext context) {}
  static void _onTapFacebook(BuildContext context) {}
  static void _onTapApple(BuildContext context) {}
}
