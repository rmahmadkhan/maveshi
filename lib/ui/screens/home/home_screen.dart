import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/home/components/farm_details.dart';
import 'package:maveshi/ui/screens/home/components/home_hawk_fab_menu.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = prefs.user?.name;

    return BaseScaffold(
      body: Consumer<FarmProvider>(
        builder: (context, provider, child) {
          final farm = provider.farm;
          if (name == null || farm == null) {
            return const Center(
                child: MyText(
                    'Error occurred while fetching data.\nPlease login again.'));
          }

          return HomeHawkFABMenu(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MyText(
                      'Hi, ${name.toUpperCase()}!',
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
                        MyText(
                          farm.name,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.whiteColor,
                          textAlign: TextAlign.center,
                        ),
                        const VerticalSpacing(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MyText(
                              'Total Active Animals:',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.whiteColor,
                            ),
                            MyText(
                              farm.animals.length.toString(),
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
          );
        },
      ),
    );
  }
}
