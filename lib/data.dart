import 'package:dreampuppy/src/features/pet_list/domain/entities/pet_card.dart';
import 'package:flutter/material.dart';

final List<PetCardEntity> cards = [
  PetCardEntity(
      breed: "Cane Corso",
      colorValue: Colors.yellow[200]!.value,
      imgUrl: 'assets/images/dogs/cane_corso.png'),
  PetCardEntity(
      imgUrl: 'assets/images/dogs/rottweiler.png',
      breed: "Rottweiler",
      description: "Robust and powerful, the Rottweiler is happiest when given a job to perform. His intelligence, endurance and willingness to work make him suitable as a police dog, herder, service dog, therapy dog, obedience competitor and devoted companion.",
      colorValue: Colors.red[200]!.value),
  PetCardEntity(breed: "Shih tzu", colorValue: Colors.blue[200]!.value),
  PetCardEntity(breed: "Spitz Alemão", colorValue: Colors.green[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
  PetCardEntity(breed: "Labrador", colorValue: Colors.purple[200]!.value),
];
