import 'package:json_annotation/json_annotation.dart';
import 'package:maveshi/models/enums/animal_event_type.dart';

part 'animal_event.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimalEvent {
  final AnimalEventType event;
  final DateTime dateTime;
  final String supervisor;
  final String notes;

  const AnimalEvent({
    required this.event,
    required this.dateTime,
    required this.supervisor,
    required this.notes,
  });

  factory AnimalEvent.fromJson(Map<String, dynamic> json) =>
      _$AnimalEventFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalEventToJson(this);
}
