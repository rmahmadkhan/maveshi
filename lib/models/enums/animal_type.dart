enum AnimalType {
  cow,
  buffalo,
  goat,
  sheep,
}

extension AnimalTypeExtension on AnimalType {
  String get value {
    switch (this) {
      case AnimalType.cow:
        return 'Cow';
      case AnimalType.buffalo:
        return 'Buffalo';
      case AnimalType.goat:
        return 'Goat';
      case AnimalType.sheep:
        return 'Sheep';
    }
  }
}
