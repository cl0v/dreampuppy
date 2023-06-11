

import '../../../../_domain/entities/pet.dart';

abstract class PetDataSource {
  Stream<Pet> fetchPetByID(String id);
  }