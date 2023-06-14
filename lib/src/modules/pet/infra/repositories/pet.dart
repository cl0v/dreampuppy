import '../../domain/details/entities/pet.dart';
import '../datasources/pet_datasource.dart';

abstract class PetRepository {
  Stream<Pet> fetchPetByID(String id);
}

class PetRepositoryImpl extends PetRepository {
  final IPetDataSource dataSource;

  PetRepositoryImpl(this.dataSource);

  @override
  Stream<Pet> fetchPetByID(String id) => dataSource.fetchPetByID(id);
}