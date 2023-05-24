import 'dart:ui';

class PetCardEntity {
  final String id;
  final String imgUrl;
  final String breed;
  final int colorValue;
  final String? description;

  PetCardEntity({
    this.id = 'id01',
    this.imgUrl = "assets/images/dogs/rottweiler.png",
    required this.breed,
    required this.colorValue,
    this.description,
  });

  Color get color => Color(colorValue);

  String get path => Uri.encodeFull(breed.toLowerCase());
}
