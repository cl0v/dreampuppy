// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      value: (json['value'] as num).toDouble(),
      description: json['description'] as String?,
      data: PetComplementarData.fromJson(json['data'] as Map<String, dynamic>),
      geoloc: Geoloc.fromJson(json['_geoloc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'data': instance.data,
      'value': instance.value,
      'description': instance.description,
      '_geoloc': instance.geoloc,
    };

PetParentData _$PetParentDataFromJson(Map<String, dynamic> json) =>
    PetParentData(
      id: json['id'] as String? ?? "",
      coverUrl: json['coverUrl'] as String,
      name: json['name'] as String,
      nick: json['nick'] as String,
      imagesUrl:
          (json['imagesUrl'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$PetParentDataToJson(PetParentData instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'name': instance.name,
      'nick': instance.nick,
      'imagesUrl': instance.imagesUrl,
      'description': instance.description,
    };

Geoloc _$GeolocFromJson(Map<String, dynamic> json) => Geoloc(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );

Map<String, dynamic> _$GeolocToJson(Geoloc instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

PetComplementarData _$PetComplementarDataFromJson(Map<String, dynamic> json) =>
    PetComplementarData(
      father: PetParentData.fromJson(json['father'] as Map<String, dynamic>),
      mother: PetParentData.fromJson(json['mother'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PetComplementarDataToJson(
        PetComplementarData instance) =>
    <String, dynamic>{
      'father': instance.father,
      'mother': instance.mother,
    };
