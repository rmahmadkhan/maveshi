import 'package:maveshi/all_utils.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
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
        ),
      ],
    );

    // return Column(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: const [
    //         Expanded(child: Divider(height: 1, color: AppTheme.navyBlueColor)),
    //         Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 10),
    //           child: MyText(
    //             'or continue with',
    //             color: AppTheme.greyColor,
    //             fontSize: 16,
    //           ),
    //         ),
    //         Expanded(child: Divider(height: 1, color: AppTheme.navyBlueColor)),
    //       ],
    //     ),
    //     const VerticalSpacing(),
    //     const SocialLoginButton(imageName: 'google', onTap: _onTapGoogle),
    //   ],
    // );
  }

  static void _onTapGoogle(BuildContext context) {}
}
