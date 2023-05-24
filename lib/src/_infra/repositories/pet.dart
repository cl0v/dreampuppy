import '../../_domain/entities/pet.dart';
import '../datasources/pet.dart';

abstract class PetRepository {
  Stream<Pet> fetchPetByID(String id);
}

class PetRepositoryImpl extends PetRepository {
  final PetDataSource dataSource;

  PetRepositoryImpl(this.dataSource);

  @override
  Stream<Pet> fetchPetByID(String id) => dataSource.fetchPetByID(id);
}