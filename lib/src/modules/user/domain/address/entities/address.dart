import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressEntity {
  String street;
  String num;
  String district;
  String complement;
  String city;
  String stateUf;
  String cep;

  AddressEntity({
    required this.street,
    required this.num,
    required this.district,
    required this.complement,
    required this.city,
    required this.stateUf,
    required this.cep,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AddressEntityToJson(this);
}
