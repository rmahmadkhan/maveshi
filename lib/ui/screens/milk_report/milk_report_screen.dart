import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/milk_report/components/milking_chart.dart';
import 'package:maveshi/ui/screens/milk_report/components/milking_dialog.dart';

class MilkReportScreen extends StatelessWidget {
  static const routeName = 'MilkReportScreen';

  const MilkReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: HawkFabMenu(
        openIcon: Icons.add,
        closeIcon: Icons.close,
        fabColor: AppTheme.orangeColor,
        iconColor: AppTheme.whiteColor,
        items: [
          HawkFabMenuItem(
            label: 'Add Milking',
            ontap: () {
              showDialog(
                context: context,
                builder: (_) => const MilkingDialog(),
              );
            },
            icon: const Icon(Icons.add),
            color: AppTheme.camelColor,
            labelColor: AppTheme.navyBlueColor,
          ),
        ],
        body: Consumer<FarmProvider>(
          builder: (context, provider, child) {
            final milkingList = provider.farm?.milkingDetails;

            if (milkingList == null || milkingList.isEmpty) {
              return const Center(
                child: MyText(
                  'No stats available.\nAdd milking to see stats.',
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(20),
              child: MilkingChart(milkingList),
            );
          },
        ),
      ),
    );
  }
}
