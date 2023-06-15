// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as String,
      coverImgUrl: json['coverImgUrl'] as String,
      price: json['price'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      imagesHistory: (json['imagesHistory'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String? ?? 'Descrição',
      genetics: json['genetics'] as String?,
      updtedAt: json['updtedAt'] == null
          ? null
          : DateTime.parse(json['updtedAt'] as String),
      category: json['category'] as String? ?? 'Cachorro',
      breed: json['breed'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      minLifeSpan: json['minLifeSpan'] as int? ?? 60,
      vaccineRecord: json['vaccineRecord'] == null
          ? null
          : VaccineRecord.fromJson(
              json['vaccineRecord'] as Map<String, dynamic>),
      gender: $enumDecodeNullable(_$PetGenderEnumMap, json['gender']) ??
          PetGender.female,
    )
      ..color = json['color'] as String?
      ..characteristics = (json['characteristics'] as List<dynamic>)
          .map((e) => e as String)
          .toList()
      ..specialCharacteristics =
          (json['specialCharacteristics'] as List<dynamic>)
              .map((e) => e as String)
              .toList();

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'coverImgUrl': instance.coverImgUrl,
      'price': instance.price,
      'images': instance.images,
      'imagesHistory': instance.imagesHistory,
      'breed': instance.breed,
      'category': instance.category,
      'description': instance.description,
      'color': instance.color,
      'minLifeSpan': instance.minLifeSpan,
      'genetics': instance.genetics,
      'updtedAt': instance.updtedAt?.toIso8601String(),
      'birthDate': instance.birthDate.toIso8601String(),
      'vaccineRecord': instance.vaccineRecord,
      'gender': _$PetGenderEnumMap[instance.gender]!,
      'characteristics': instance.characteristics,
      'specialCharacteristics': instance.specialCharacteristics,
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

Vaccine _$VaccineFromJson(Map<String, dynamic> json) => Vaccine(
      brand: json['brand'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$VaccineToJson(Vaccine instance) => <String, dynamic>{
      'brand': instance.brand,
      'date': instance.date.toIso8601String(),
    };

Dewormer _$DewormerFromJson(Map<String, dynamic> json) => Dewormer(
      brand: json['brand'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DewormerToJson(Dewormer instance) => <String, dynamic>{
      'brand': instance.brand,
      'date': instance.date.toIso8601String(),
    };
