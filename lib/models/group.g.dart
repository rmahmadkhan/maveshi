// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as String,
      name: json['name'] as String,
      animals: (json['animals'] as List<dynamic>)
          .map((e) => Animal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'animals': instance.animals.map((e) => e.toJson()).toList(),
    };
