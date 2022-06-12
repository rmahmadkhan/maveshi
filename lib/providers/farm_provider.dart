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
    if (farm != null) await prefs.setFarm(farm!);
    filterAll();
    notifyListeners();
  }

  Future<void> addAnimal(Animal animal) async {
    if (farm == null) return;

    farm!.animals.removeWhere((a) => a.id == animal.id);
    farm!.animals.add(animal);
    await prefs.setFarm(farm!);
    await farmRepository.add(farm!);
    filterAll();
    notifyListeners();
  }

  void filterAll() {
    cows = filterAnimalsOnType(farm?.animals ?? [], AnimalType.cow);
    buffaloes = filterAnimalsOnType(farm?.animals ?? [], AnimalType.buffalo);
    goats = filterAnimalsOnType(farm?.animals ?? [], AnimalType.goat);
    sheeps = filterAnimalsOnType(farm?.animals ?? [], AnimalType.sheep);
  }

  static List<Animal> filterAnimalsOnType(
      List<Animal> animalList, AnimalType type) {
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

  List<Animal> getChildren(String id, AnimalType type) {
    switch (type) {
      case AnimalType.cow:
        return cows
            .where((animal) => animal.motherId == id || animal.fatherId == id)
            .toList();
      case AnimalType.buffalo:
        return buffaloes
            .where((animal) => animal.motherId == id || animal.fatherId == id)
            .toList();
      case AnimalType.goat:
        return goats
            .where((animal) => animal.motherId == id || animal.fatherId == id)
            .toList();
      case AnimalType.sheep:
        return sheeps
            .where((animal) => animal.motherId == id || animal.fatherId == id)
            .toList();
    }
  }
}
