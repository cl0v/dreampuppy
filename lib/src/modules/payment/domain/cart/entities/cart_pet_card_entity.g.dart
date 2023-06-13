// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_pet_card_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartPetCardEntity _$CartPetCardEntityFromJson(Map<String, dynamic> json) =>
    CartPetCardEntity(
      id: json['id'] as String,
      resume: json['resume'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$CartPetCardEntityToJson(CartPetCardEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resume': instance.resume,
      'price': instance.price,
    };
