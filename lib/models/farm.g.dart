// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Farm _$FarmFromJson(Map<String, dynamic> json) => Farm(
      id: json['id'] as String,
      name: json['name'] as String,
      currency: json['currency'] as String,
      owner: json['owner'] as String,
      animals: (json['animals'] as List<dynamic>)
          .map((e) => Animal.fromJson(e as Map<String, dynamic>))
          .toList(),
      milkingDetails: (json['milkingDetails'] as List<dynamic>)
          .map((e) => Milk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FarmToJson(Farm instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'owner': instance.owner,
      'animals': instance.animals.map((e) => e.toJson()).toList(),
      'milkingDetails': instance.milkingDetails.map((e) => e.toJson()).toList(),
    };
