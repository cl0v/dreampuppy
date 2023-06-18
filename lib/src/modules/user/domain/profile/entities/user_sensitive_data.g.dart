// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sensitive_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSensitiveDataEntity _$UserSensitiveDataEntityFromJson(
        Map<String, dynamic> json) =>
    UserSensitiveDataEntity(
      name: json['name'] as String,
      phone: json['phone'] as String,
      cpf: json['cpf'] as String,
    )..email = json['email'] as String;

Map<String, dynamic> _$UserSensitiveDataEntityToJson(
        UserSensitiveDataEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'cpf': instance.cpf,
    };
