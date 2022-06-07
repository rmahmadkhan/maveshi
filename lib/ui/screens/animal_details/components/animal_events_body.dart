import 'package:intl/intl.dart';
import 'package:maveshi/all_utils.dart';

class AnimalEventsBody extends StatelessWidget {
  final List<AnimalEvent>? events;

  const AnimalEventsBody(this.events, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (events == null || events!.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        const Divider(
          thickness: 1,
          color: AppTheme.navyBlueColor,
          height: 30,
        ),
        MyCard(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const MyText(
                  'Latest Events',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                const VerticalSpacing(of: 10),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        events![index].event.value,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.navyBlueColor,
                      ),
                      MyText(
                        DateFormat.yMMMd().format(events![index].dateTime),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.navyBlueColor,
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1, height: 20),
                  itemCount: events!.length,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
