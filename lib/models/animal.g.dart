// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal(
      id: json['id'] as String,
      tag: json['tag'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      type: $enumDecode(_$AnimalTypeEnumMap, json['type']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      breed: json['breed'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      age: json['age'] as int,
      obtainedBy: $enumDecode(_$AnimalObtainedByEnumMap, json['obtainedBy']),
      farmJoiningDate: DateTime.parse(json['farmJoiningDate'] as String),
      gotFrom: json['gotFrom'] as String,
      initialPrice: (json['initialPrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      fatherId: json['fatherId'] as String,
      motherId: json['motherId'] as String,
      notes: json['notes'] as String,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => AnimalEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'type': _$AnimalTypeEnumMap[instance.type],
      'gender': _$GenderEnumMap[instance.gender],
      'breed': instance.breed,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'age': instance.age,
      'obtainedBy': _$AnimalObtainedByEnumMap[instance.obtainedBy],
      'farmJoiningDate': instance.farmJoiningDate.toIso8601String(),
      'gotFrom': instance.gotFrom,
      'initialPrice': instance.initialPrice,
      'currentPrice': instance.currentPrice,
      'fatherId': instance.fatherId,
      'motherId': instance.motherId,
      'notes': instance.notes,
      'events': instance.events?.map((e) => e.toJson()).toList(),
    };

const _$AnimalTypeEnumMap = {
  AnimalType.cow: 'cow',
  AnimalType.buffalo: 'buffalo',
  AnimalType.goat: 'goat',
  AnimalType.sheep: 'sheep',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};

const _$AnimalObtainedByEnumMap = {
  AnimalObtainedBy.birth: 'birth',
  AnimalObtainedBy.purchase: 'purchase',
  AnimalObtainedBy.gift: 'gift',
};
