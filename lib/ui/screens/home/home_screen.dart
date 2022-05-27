import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/common_widgets/my_card.dart';
import 'package:maveshi/ui/screens/home/components/farm_details.dart';
import 'package:maveshi/ui/screens/home/components/home_hawk_fab_menu.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: HomeHawkFABMenu(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  'Hi, Harry!',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSpacing(),
              MyCard(
                color: AppTheme.navyBlueColor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const MyText(
                      'Harry\'s Cattle Farm',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.whiteColor,
                    ),
                    const VerticalSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        MyText(
                          'Total Active Animals:',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.whiteColor,
                        ),
                        MyText(
                          '30',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.whiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(),
              const FarmDetails(),
              const VerticalSpacing(),
              Image.asset('assets/images/farm.png', fit: BoxFit.fitWidth),
            ],
          ),
        ),
      ),
    );
  }
}
