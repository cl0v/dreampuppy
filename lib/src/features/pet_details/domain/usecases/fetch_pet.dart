import '../../../../_domain/entities/pet.dart';
import '../../../../_infra/repositories/pet.dart';

abstract class FetchPetByIDUseCase {
  Stream<Pet> call(String id);
}

class FetchPetByIDUseCaseImpl implements FetchPetByIDUseCase {
  final PetRepository repository;

  FetchPetByIDUseCaseImpl(this.repository);

  @override
  Stream<Pet> call(String id) => repository.fetchPetByID(id);
}
