import 'package:dreampuppy/src/features/pet_details/infra/repositories/pet.dart';
import 'package:dreampuppy/src/features/pet_details/external/datasources/firestore_pet.dart';
import 'package:dreampuppy/src/modules/pet/presenter/gallery/page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../features/pet_details/domain/usecases/fetch_pet.dart';
import '../../features/pet_details/infra/datasources/pet.dart';
import '../../features/pet_details/presentation/bloc/fetch_pet.dart';
import '../../features/pet_details/presentation/view/pet_details.dart';
import '../../../algolia_application.dart';

class PetsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AlgoliaApplication()),
    Bind.factory<FetchPetBloc>((i) => FetchPetBloc()),
    Bind.factory<PetRepository>((i) => PetRepositoryImpl(i())),
    Bind.factory<PetDataSource>((i) => FirestorePetDataSourceImpl(i())),
    Bind.factory<FetchPetByIDUseCase>((i) => FetchPetByIDUseCaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/p/:id', child: (_, args) {
      final id = args.params['id'];
      return PetDetailsPage(id: id);
    }),
    ChildRoute('/:breed/gallery', child: (c, args) {
      final String breed = args.params['breed'];
      return GalleryPage(breed: breed);
    }),
  ];
}
