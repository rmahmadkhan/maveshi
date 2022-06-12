import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/animal_details/components/title_value_text.dart';

class MilkingStatsCard extends StatelessWidget {
  final List<Milk> milkings;

  const MilkingStatsCard(this.milkings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const TitleValueText(
            title: 'Total:',
            value: 'Daily Average',
            titleColor: AppTheme.navyBlueColor,
            titleFontSize: 18,
            valueFontSize: 18,
            valueFontWeight: FontWeight.w500,
          ),
          const Spacer(),
          TitleValueText(
            title: '${_getTotalMilk().toStringAsFixed(1)} Liters',
            value: '${_getAverageMilk().toStringAsFixed(1)} Liters',
            titleColor: AppTheme.navyBlueColor,
            titleFontSize: 18,
            valueFontSize: 18,
            valueFontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  double _getTotalMilk() {
    double total = 0;
    for (Milk m in milkings) {
      total += m.liters;
    }
    return total;
  }

  double _getAverageMilk() {
    double avg = 0;
    for (Milk m in milkings) {
      avg += m.liters;
    }
    return avg / milkings.length;
  }
}
