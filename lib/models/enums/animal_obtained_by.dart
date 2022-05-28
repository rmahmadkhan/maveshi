enum AnimalObtainedBy {
  birth,
  purchase,
  gift,
}

extension AnimalObtainedByExtension on AnimalObtainedBy {
  String get value {
    switch (this) {
      case AnimalObtainedBy.birth:
        return 'Birth';
      case AnimalObtainedBy.purchase:
        return 'Purchase';
      case AnimalObtainedBy.gift:
        return 'Gift';
    }
  }
}
