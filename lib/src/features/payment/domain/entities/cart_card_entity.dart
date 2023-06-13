import 'package:json_annotation/json_annotation.dart';

part 'cart_card_entity.g.dart';

@JsonSerializable()
class CartPetCardEntity {
  final String id;
  final String resume;
  final int price;
  
  CartPetCardEntity({
    required this.id,
    required this.resume,
    required this.price,
  });

  factory CartPetCardEntity.fromJson(Map<String, dynamic> json) =>
      _$CartPetCardEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CartPetCardEntityToJson(this);
}
