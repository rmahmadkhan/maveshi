import 'package:json_annotation/json_annotation.dart';

part 'local_user.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalUser {
  final String email;
  final String? name;
  final String? imagePath;
  final String? fcmToken;
  final String? farmId;

  const LocalUser({
    required this.email,
    this.name,
    this.imagePath,
    this.fcmToken,
    this.farmId,
  });

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);
}
