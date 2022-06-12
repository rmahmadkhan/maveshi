import 'package:json_annotation/json_annotation.dart';

part 'milk.g.dart';

@JsonSerializable(explicitToJson: true)
class Milk {
  final DateTime dateTime;
  final double liters;

  const Milk({
    required this.dateTime,
    required this.liters,
  });

  factory Milk.fromJson(Map<String, dynamic> json) => _$MilkFromJson(json);

  Map<String, dynamic> toJson() => _$MilkToJson(this);
}
