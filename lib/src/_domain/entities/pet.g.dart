// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as String,
      coverImgUrl: json['coverImgUrl'] as String,
      price: json['price'] as int? ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imagesHistory: (json['imagesHistory'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String? ?? 'Descrição',
      genetics: json['genetics'] as String? ?? "Genetica",
      lastUpdate: json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      vaccineRecord: json['vaccineRecord'] == null
          ? null
          : VaccineRecord.fromJson(
              json['vaccineRecord'] as Map<String, dynamic>),
      gender: $enumDecodeNullable(_$PetGenderEnumMap, json['gender']) ??
          PetGender.female,
    )..characteristics = (json['characteristics'] as List<dynamic>)
        .map((e) => e as String)
        .toList();

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'coverImgUrl': instance.coverImgUrl,
      'price': instance.price,
      'images': instance.images,
      'imagesHistory': instance.imagesHistory,
      'description': instance.description,
      'genetics': instance.genetics,
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
      'birthDate': instance.birthDate?.toIso8601String(),
      'vaccineRecord': instance.vaccineRecord,
      'gender': _$PetGenderEnumMap[instance.gender]!,
      'characteristics': instance.characteristics,
    };

const _$PetGenderEnumMap = {
  PetGender.female: 'female',
  PetGender.male: 'male',
};

VaccineRecord _$VaccineRecordFromJson(Map<String, dynamic> json) =>
    VaccineRecord(
      vaccines: (json['vaccines'] as List<dynamic>)
          .map((e) => Vaccine.fromJson(e as Map<String, dynamic>))
          .toList(),
      dewormers: (json['dewormers'] as List<dynamic>)
          .map((e) => Dewormer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VaccineRecordToJson(VaccineRecord instance) =>
    <String, dynamic>{
      'vaccines': instance.vaccines,
      'dewormers': instance.dewormers,
    };

Dewormer _$DewormerFromJson(Map<String, dynamic> json) => Dewormer(
      brand: json['brand'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DewormerToJson(Dewormer instance) => <String, dynamic>{
      'brand': instance.brand,
      'date': instance.date.toIso8601String(),
    };

Vaccine _$VaccineFromJson(Map<String, dynamic> json) => Vaccine(
      brand: json['brand'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$VaccineToJson(Vaccine instance) => <String, dynamic>{
      'brand': instance.brand,
      'date': instance.date.toIso8601String(),
    };
