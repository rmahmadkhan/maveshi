// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalUser _$LocalUserFromJson(Map<String, dynamic> json) => LocalUser(
      email: json['email'] as String,
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
      fcmToken: json['fcmToken'] as String?,
      farmId: json['farmId'] as String?,
    );

Map<String, dynamic> _$LocalUserToJson(LocalUser instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'fcmToken': instance.fcmToken,
      'farmId': instance.farmId,
    };
