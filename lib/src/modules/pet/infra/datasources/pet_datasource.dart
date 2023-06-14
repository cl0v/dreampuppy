

import '../../domain/details/entities/pet.dart';

abstract class IPetDataSource {
  Stream<Pet> fetchPetByID(String id);
  }