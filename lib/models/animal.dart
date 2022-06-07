import 'package:json_annotation/json_annotation.dart';
import 'package:maveshi/models/animal_event.dart';
import 'package:maveshi/models/enums/animal_obtained_by.dart';
import 'package:maveshi/models/enums/animal_type.dart';
import 'package:maveshi/models/enums/gender.dart';

part 'animal.g.dart';

@JsonSerializable(explicitToJson: true)
class Animal {
  final String id;
  final String tag;
  final String name;
  final String imagePath;
  final AnimalType type;
  final Gender gender;
  final String breed;
  final DateTime dateOfBirth;
  final int age;
  final AnimalObtainedBy obtainedBy;
  final DateTime farmJoiningDate;
  final String gotFrom;
  final double initialPrice;
  final double currentPrice;
  final String fatherId;
  final String motherId;
  final String groupId;
  final String notes;
  final List<AnimalEvent>? events;

  const Animal({
    required this.id,
    required this.tag,
    required this.name,
    required this.imagePath,
    required this.type,
    required this.gender,
    required this.breed,
    required this.dateOfBirth,
    required this.age,
    required this.obtainedBy,
    required this.farmJoiningDate,
    required this.gotFrom,
    required this.initialPrice,
    required this.currentPrice,
    required this.fatherId,
    required this.motherId,
    required this.groupId,
    required this.notes,
    this.events,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalToJson(this);
}
