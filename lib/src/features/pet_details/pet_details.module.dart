import 'package:dreampuppy/src/_infra/datasources/pet.dart';
import 'package:dreampuppy/src/_infra/repositories/pet.dart';
import 'package:dreampuppy/src/external/datasources/firestore_pet.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/fetch_pet.dart';
import 'presentation/bloc/fetch_pet.dart';
import 'presentation/view/pet_details.dart';

class PetDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FetchPetBloc>((i) => FetchPetBloc()),
    Bind.factory<PetDataSource>((i) => FirestorePetDataSourceImpl(i())),
    Bind.factory<PetRepository>((i) => PetRepositoryImpl(i())),
    Bind.factory<FetchPetByIDUseCase>((i) => FetchPetByIDUseCaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:id', child: (_, args) => PetDetailsPage(
      id: args.params['id'],
      pet: args.data,
    )),
  ];
}