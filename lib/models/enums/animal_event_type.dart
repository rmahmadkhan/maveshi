enum AnimalEventType {
  inseminated,
  pregnant,
  milking,
  medication,
}

extension AnimalEventTypeExtension on AnimalEventType {
  String get value {
    switch (this) {
      case AnimalEventType.inseminated:
        return 'Inseminated';
      case AnimalEventType.pregnant:
        return 'Pregnant';
      case AnimalEventType.milking:
        return 'Milking';
      case AnimalEventType.medication:
        return 'Medication';
    }
  }
}
