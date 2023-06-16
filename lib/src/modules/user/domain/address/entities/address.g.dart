// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressEntity _$AddressEntityFromJson(Map<String, dynamic> json) =>
    AddressEntity(
      street: json['street'] as String,
      num: json['num'] as String,
      district: json['district'] as String,
      complement: json['complement'] as String,
      city: json['city'] as String,
      stateUf: json['stateUf'] as String,
      cep: json['cep'] as String,
    );

Map<String, dynamic> _$AddressEntityToJson(AddressEntity instance) =>
    <String, dynamic>{
      'street': instance.street,
      'num': instance.num,
      'district': instance.district,
      'complement': instance.complement,
      'city': instance.city,
      'stateUf': instance.stateUf,
      'cep': instance.cep,
    };
