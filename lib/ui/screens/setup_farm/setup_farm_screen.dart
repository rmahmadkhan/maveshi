import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/setup_farm/components/setup_farm_form.dart';

class SetupFarmScreen extends StatelessWidget {
  static const routeName = '/SetupFarm';

  const SetupFarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyText(
              'Setup your farm!',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            VerticalSpacing(of: 10),
            MyText(
              'Add details about your farm',
              fontSize: 20,
              color: AppTheme.greyColor,
            ),
            VerticalSpacing(of: 30),
            SetupFarmForm(),
          ],
        ),
      ),
    );
  }
}
