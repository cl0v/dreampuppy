// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dog _$DogFromJson(Map<String, dynamic> json) => Dog(
      breed: json['breed'] as String,
      data: PetComplementarData.fromJson(json['data'] as Map<String, dynamic>),
      value: (json['value'] as num).toDouble(),
      ninhadaId: json['ninhadaId'] as String,
    )
      ..category = json['category'] as String
      ..description = json['description'] as String?;

Map<String, dynamic> _$DogToJson(Dog instance) => <String, dynamic>{
      'category': instance.category,
      'data': instance.data,
      'value': instance.value,
      'description': instance.description,
      'ninhadaId': instance.ninhadaId,
      'breed': instance.breed,
    };

DogRequiredData _$DogRequiredDataFromJson(Map<String, dynamic> json) =>
    DogRequiredData(
      father: PetParentData.fromJson(json['father'] as Map<String, dynamic>),
      mother: PetParentData.fromJson(json['mother'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DogRequiredDataToJson(DogRequiredData instance) =>
    <String, dynamic>{
      'father': instance.father,
      'mother': instance.mother,
    };
