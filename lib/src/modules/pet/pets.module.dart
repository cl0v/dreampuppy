import 'package:dreampuppy/src/modules/pet/domain/gallery/usecases/populate_gallery.dart';
import 'package:dreampuppy/src/modules/pet/external/datasources/algolia_gallery.dart';
import 'package:dreampuppy/src/modules/pet/infra/datasources/gallery_datasource.dart';
import 'package:dreampuppy/src/modules/pet/infra/repositories/gallery.dart';
import 'package:dreampuppy/src/modules/pet/infra/repositories/pet.dart';
import 'package:dreampuppy/src/modules/pet/external/datasources/firestore_pet.dart';
import 'package:dreampuppy/src/modules/pet/presenter/gallery/gallery_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/details/usecases/fetch_pet.dart';
import 'infra/datasources/pet_datasource.dart';
import 'presenter/details/bloc/fetch_pet.dart';
import 'presenter/details/details_page.dart';
import 'external/configs/algolia_application.dart';
import 'presenter/gallery/bloc/fetch_gallery.dart';

class PetsModule extends Module {
  @override
  final List<Bind> binds = [
    // Gallery
    Bind.lazySingleton(
      (i) => AlgoliaApplication(),
    ),
    Bind.factory<IGalleryDatasource>(
      (i) => kDebugMode
          ? MockedGalleryDatasourceI()
          : AlogliaGalleryDatasourceI(i()),
    ),
    Bind.factory<IGalleryRepository>(
      (i) => GalleryRepositoryI(i()),
    ),
    Bind.factory<PopulateGalleryUseCase>(
      (i) => PopulateGalleryUseCaseImpl(i()),
    ),
    Bind.factory<FillGalleryBloc>(
      (i) => FillGalleryBloc(i()),
    ),

    // Pet Details
    Bind.factory<FetchPetBloc>((i) => FetchPetBloc()),
    Bind.factory<PetRepository>((i) => PetRepositoryImpl(i())),
    Bind.factory<IPetDataSource>(
      (i) =>
          kDebugMode ? MockedPetDataSourceI() : FirestorePetDataSourceImpl(i()),
    ),
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
