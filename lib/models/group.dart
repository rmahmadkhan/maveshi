import 'package:json_annotation/json_annotation.dart';
import 'package:maveshi/models/animal.dart';

part 'group.g.dart';

@JsonSerializable(explicitToJson: true)
class Group {
  final String id;
  final String name;
  final List<Animal> animals;

  const Group({
    required this.id,
    required this.name,
    required this.animals,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
