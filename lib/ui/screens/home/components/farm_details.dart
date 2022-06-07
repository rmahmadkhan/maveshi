import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/animal_details/animal_details_screen.dart';
import 'package:maveshi/ui/screens/home/components/animal_count_card.dart';

class FarmDetails extends StatefulWidget {
  const FarmDetails({Key? key}) : super(key: key);

  @override
  State<FarmDetails> createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  final _groupController = TextEditingController();

  @override
  void dispose() {
    _groupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyDropdown(
          controller: _groupController,
          list: const ['All Groups', 'Group 1', 'Group 2'],
          hint: 'All Groups',
        ),
        const VerticalSpacing(),
        Row(
          children: [
            Expanded(
              child: AnimalCountCard(
                AnimalType.cow,
                count: 10,
                onTap: () {},
              ),
            ),
            const HorizontalSpacing(),
            Expanded(
              child: AnimalCountCard(
                AnimalType.buffalo,
                count: 8,
                onTap: () {},
              ),
            ),
          ],
        ),
        const VerticalSpacing(of: 10),
        Row(
          children: [
            Expanded(
              child: AnimalCountCard(
                AnimalType.goat,
                count: 7,
                onTap: () {},
              ),
            ),
            const HorizontalSpacing(),
            Expanded(
              child: AnimalCountCard(
                AnimalType.sheep,
                count: 5,
                onTap: () {},
              ),
            ),
          ],
        ),
        const VerticalSpacing(),
        MyElevatedButton('See All',
            onTap: (_) =>
                Navigator.pushNamed(context, AnimalDetailsScreen.routeName)),
      ],
    );
  }
}
