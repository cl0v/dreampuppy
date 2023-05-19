import 'package:dreampuppy/src/features/pet_list/domain/entities/pet_card.dart';
import 'package:flutter/material.dart';

final List<PetCardEntity> cards = [
  PetCardEntity(
      breed: "Cane Corso",
      path: "cane%20corso",
      colorValue: Colors.yellow[200]!.value,
      imgUrl: 'assets/images/dogs/cane_corso.png'),
  PetCardEntity(
      imgUrl: 'assets/images/dogs/rottweiler.png',
      breed: "Rottweiler",
      colorValue: Colors.red[200]!.value),
  PetCardEntity(breed: "Shih tzu", colorValue: Colors.blue[200]!.value),
  PetCardEntity(breed: "Spitz Alemão", colorValue: Colors.green[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
];
