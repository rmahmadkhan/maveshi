// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Milk _$MilkFromJson(Map<String, dynamic> json) => Milk(
      dateTime: DateTime.parse(json['dateTime'] as String),
      liters: (json['liters'] as num).toDouble(),
    );

Map<String, dynamic> _$MilkToJson(Milk instance) => <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'liters': instance.liters,
    };
