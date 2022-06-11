import 'package:maveshi/all_utils.dart';

class FarmProvider extends ChangeNotifier {
  Farm? farm = prefs.farm;
  List<Animal> cows = [];
  List<Animal> buffaloes = [];
  List<Animal> goats = [];
  List<Animal> sheeps = [];

  FarmProvider() {
    filterAll();
  }

  Future<void> fetchFarmFromDatabase(String farmId) async {
    farm = await farmRepository.get(farmId);
    if (farm != null) {
      prefs.setFarm(farm!);
    }
    notifyListeners();
  }

  void addAnimal(Animal animal) {
    if (farm == null) return;

    farm!.animals.add(animal);
    prefs.setFarm(farm!);
    farmRepository.add(farm!);
    filterAll();
    notifyListeners();
  }

  void filterAll() {
    cows = filterAnimals(farm?.animals ?? [], AnimalType.cow);
    buffaloes = filterAnimals(farm?.animals ?? [], AnimalType.buffalo);
    goats = filterAnimals(farm?.animals ?? [], AnimalType.goat);
    sheeps = filterAnimals(farm?.animals ?? [], AnimalType.sheep);
  }

  static List<Animal> filterAnimals(List<Animal> animalList, AnimalType type) {
    final List<Animal> list = [];
    for (Animal animal in animalList) {
      if (animal.type == type) list.add(animal);
    }
    return list;
  }

  static List<Animal> filterAnimalsOnGender(
      List<Animal> animalList, Gender gender) {
    final List<Animal> list = [];
    for (Animal animal in animalList) {
      if (animal.gender == gender) list.add(animal);
    }
    return list;
  }
}
