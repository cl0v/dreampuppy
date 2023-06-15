import 'package:json_annotation/json_annotation.dart';

part 'user_sensitive_data.g.dart';

@JsonSerializable()
class UserSensitiveDataEntity {
  final String name;
  final String phone;
  final String cpf;

  UserSensitiveDataEntity({
    required this.name,
    required this.phone,
    required this.cpf,
  });

  factory UserSensitiveDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSensitiveDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserSensitiveDataEntityToJson(this);
}
