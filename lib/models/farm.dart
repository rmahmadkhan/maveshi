import 'package:json_annotation/json_annotation.dart';
import 'package:maveshi/all_utils.dart';

part 'farm.g.dart';

@JsonSerializable(explicitToJson: true)
class Farm {
  final String id;
  final String name;
  final String currency;
  final String owner;
  final List<Animal> animals;

  const Farm({
    required this.id,
    required this.name,
    required this.currency,
    required this.owner,
    required this.animals,
  });

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);

  Map<String, dynamic> toJson() => _$FarmToJson(this);
}
