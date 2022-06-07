// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalEvent _$AnimalEventFromJson(Map<String, dynamic> json) => AnimalEvent(
      event: $enumDecode(_$AnimalEventTypeEnumMap, json['event']),
      dateTime: DateTime.parse(json['dateTime'] as String),
      supervisor: json['supervisor'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$AnimalEventToJson(AnimalEvent instance) =>
    <String, dynamic>{
      'event': _$AnimalEventTypeEnumMap[instance.event],
      'dateTime': instance.dateTime.toIso8601String(),
      'supervisor': instance.supervisor,
      'notes': instance.notes,
    };

const _$AnimalEventTypeEnumMap = {
  AnimalEventType.inseminated: 'inseminated',
  AnimalEventType.pregnant: 'pregnant',
  AnimalEventType.milking: 'milking',
  AnimalEventType.medication: 'medication',
};
