import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/home/components/animal_count_card.dart';

class FarmDetails extends StatelessWidget {
  const FarmDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmProvider>(
      builder: (context, provider, child) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AnimalCountCard(
                  AnimalType.cow,
                  count: provider.cows.length,
                  onTap: () =>
                      _onTapAnimalCard(context, provider.cows, AnimalType.cow),
                ),
              ),
              const HorizontalSpacing(),
              Expanded(
                child: AnimalCountCard(
                  AnimalType.buffalo,
                  count: provider.buffaloes.length,
                  onTap: () => _onTapAnimalCard(
                      context, provider.buffaloes, AnimalType.buffalo),
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
                  count: provider.goats.length,
                  onTap: () => _onTapAnimalCard(
                      context, provider.goats, AnimalType.goat),
                ),
              ),
              const HorizontalSpacing(),
              Expanded(
                child: AnimalCountCard(
                  AnimalType.sheep,
                  count: provider.sheeps.length,
                  onTap: () => _onTapAnimalCard(
                      context, provider.sheeps, AnimalType.sheep),
                ),
              ),
            ],
          ),
          const VerticalSpacing(),
          MyElevatedButton(
            'See All',
            onTap: (_) =>
                _onTapAnimalCard(context, provider.farm?.animals ?? [], null),
          ),
        ],
      ),
    );
  }

  void _onTapAnimalCard(
      BuildContext context, List<Animal> animals, AnimalType? type) {
    if (animals.isEmpty) {
      EasyLoading.showInfo(
          'No ${type?.value.toLowerCase() ?? 'animal'}s in the farm!');
    } else {
      Navigator.pushNamed(context, GroupViewScreen.routeName,
          arguments: animals);
    }
  }
}
