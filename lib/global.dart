import 'package:maveshi/all_utils.dart';
import 'package:maveshi/models/group.dart';

final animal = Animal(
    id: '123',
    tag: 'A-101',
    name: 'Alpha',
    imagePath: '',
    type: AnimalType.cow,
    gender: Gender.female,
    breed: 'Australian',
    dateOfBirth: DateTime.now(),
    age: 0,
    obtainedBy: AnimalObtainedBy.birth,
    farmJoiningDate: DateTime.now(),
    gotFrom: 'By Birth',
    initialPrice: 50000,
    currentPrice: 50000,
    fatherId: 'fatherId',
    motherId: 'motherId',
    groupId: 'groupId',
    notes: 'notes',
    events: [
      AnimalEvent(
          event: AnimalEventType.milking,
          dateTime: DateTime.now(),
          supervisor: 'John',
          notes: ''),
      AnimalEvent(
          event: AnimalEventType.inseminated,
          dateTime: DateTime.now(),
          supervisor: 'John',
          notes: '')
    ]);

final group = Group(id: 'Group A', name: 'Group A', animals: [animal, animal]);
