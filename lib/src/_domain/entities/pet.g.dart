// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as String,
      coverImgUrl: json['coverImgUrl'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      isMale: json['isMale'] as bool? ?? true,
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'coverImgUrl': instance.coverImgUrl,
      'images': instance.images,
      'isMale': instance.isMale,
    };
