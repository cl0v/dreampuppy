import 'dart:ui';

class PetCardEntity {
  final String id;
  final String imgUrl;
  final String breed;
  final int colorValue;
  final String path;

  PetCardEntity({
    this.id = 'id01',
    this.imgUrl = "assets/images/dogs/rottweiler.png",
    required this.breed,
    required this.colorValue,
    this.path = 'rottweiler',
  });

  Color get color => Color(colorValue);
}
