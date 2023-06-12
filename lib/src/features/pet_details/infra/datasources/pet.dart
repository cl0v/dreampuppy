

import '../../../../modules/pet/domain/details/entities/pet.dart';

abstract class PetDataSource {
  Stream<Pet> fetchPetByID(String id);
  }