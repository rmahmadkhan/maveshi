import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/milk_report/components/milking_stats_card.dart';
import 'package:maveshi/ui/screens/milk_report/components/toggle_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MilkingChart extends StatefulWidget {
  final List<Milk> milkingDetails;

  const MilkingChart(this.milkingDetails, {Key? key}) : super(key: key);

  @override
  State<MilkingChart> createState() => _MilkChartState();
}

class _MilkChartState extends State<MilkingChart> {
  final List<bool> isSelected = [true, false, false];
  final List<String> toggleButtonTitles = ['Full', '15 Days', '7 Days'];
  int chartIndex = 0;
  List<Milk> filteredMilkings = [];

  List<Milk> _getFilteredMilks(List<Milk> milkings) {
    switch (chartIndex) {
      case 0:
        return milkings;
      case 1:
        {
          final List<Milk> list = [];
          for (Milk m in milkings) {
            if (m.dateTime
                .isAfter(DateTime.now().subtract(const Duration(days: 15)))) {
              list.add(m);
            }
          }
          return list;
        }
      case 2:
        {
          final List<Milk> list = [];
          for (Milk m in milkings) {
            if (m.dateTime
                .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
              list.add(m);
            }
          }
          return list;
        }
    }
    return [];
  }

  BorderRadius? _getBorderRadius(int index) {
    switch (index) {
      case 0:
        return const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        );
      case 2:
        return const BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        );
    }
    return null;
  }

  @override
  initState() {
    super.initState();
    filteredMilkings = widget.milkingDetails;
  }

  @override
  Widget build(BuildContext context) {
    double max = widget.milkingDetails.first.liters;
    for (final value in widget.milkingDetails) {
      if (value.liters > max) max = value.liters;
    }

    return Column(
      children: [
        ToggleButtons(
          renderBorder: false,
          fillColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
                chartIndex = index;
                filteredMilkings = _getFilteredMilks(widget.milkingDetails);
              }
            });
          },
          isSelected: isSelected,
          children: toggleButtonTitles
              .mapIndexed((index, e) => ToggleContainer(
                    title: toggleButtonTitles[index],
                    isSelected: isSelected[index],
                    borderRadius: _getBorderRadius(index),
                  ))
              .toList(),
        ),
        const VerticalSpacing(),
        MilkingStatsCard(filteredMilkings),
        const VerticalSpacing(),
        Expanded(
          child: Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
              child: SfCartesianChart(
                // title: ChartTitle(
                //     text: title,
                //     alignment: ChartAlignment.center,
                //     textStyle: const TextStyle(
                //       color: AppTheme.redPinkColor,
                //       fontSize: 20,
                //       fontMilk: FontMilk.w600,
                //     ),
                //   ),
                primaryXAxis: DateTimeAxis(),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: max * 1.1,
                  interval: max / 10,
                  associatedAxisName: 'Milk',
                  rangePadding: ChartRangePadding.additional,
                ),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  textStyle: Theme.of(context).textTheme.caption,
                ),
                tooltipBehavior:
                    TooltipBehavior(enable: true, canShowMarker: true),
                enableAxisAnimation: true,
                series: <ChartSeries<Milk, DateTime>>[
                  LineSeries<Milk, DateTime>(
                    dataSource: filteredMilkings.sorted(
                        (a, b) => a.dateTime.isBefore(b.dateTime) ? 1 : 0),
                    xValueMapper: (Milk data, _) => data.dateTime,
                    yValueMapper: (Milk data, _) => data.liters,
                    name: 'Milk',
                    legendItemText: 'Milk (Liters)',
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      useSeriesColor: true,
                    ),
                    markerSettings: const MarkerSettings(isVisible: true),
                    color: AppTheme.navyBlueColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
