import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_card.dart';

class AnimalChildrenDetails extends StatelessWidget {
  final List<Animal>? animals;

  const AnimalChildrenDetails(this.animals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (animals == null || animals!.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        const Divider(
          thickness: 1,
          color: AppTheme.navyBlueColor,
          height: 30,
        ),
        Column(
          children: [
            const MyText(
              'Children',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            const VerticalSpacing(of: 10),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  AnimalCard(animals![index], height: 50),
              separatorBuilder: (context, index) =>
                  const VerticalSpacing(of: 10),
              itemCount: animals!.length,
            ),
          ],
        ),
      ],
    );
  }
}
