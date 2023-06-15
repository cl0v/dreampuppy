import 'package:dreampuppy/src/pages/not_found.dart';

import 'domain/details/usecases/build_resumed_description.dart';
import 'domain/details/usecases/format_birthdate.dart';
import 'domain/details/usecases/format_vaccination_record.dart';
import 'domain/gallery/usecases/populate_gallery.dart';
import 'domain/gallery/usecases/format_genetics.dart';
import 'external/datasources/algolia_gallery.dart';
import 'infra/datasources/gallery_datasource.dart';
import 'infra/repositories/gallery.dart';
import 'infra/repositories/pet.dart';
import 'external/datasources/firestore_pet.dart';
import 'presenter/gallery/gallery_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/details/usecases/fetch_pet.dart';
import 'domain/details/usecases/format_last_update.dart';
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
    Bind.factory<IPetDataSource>(
      (i) => kDebugMode
          ? MockedPetDataSourceI()
          : FirestorePetDataSourceImpl(
              i(),
            ),
    ),
    Bind.factory<PetRepository>(
      (i) => PetRepositoryImpl(i()),
    ),
    Bind.factory<FetchPetByIDUseCase>(
      (i) => FetchPetByIDUseCaseImpl(i()),
    ),
    Bind.factory<FormatBirthDateUsecase>(
      (i) => FormatBirthDateUsecaseI(),
    ),
    Bind.factory<BuildResumedDescription>(
      (i) => BuildResumedDescriptionI(),
    ),
    Bind.factory<FormatVaccinationRecordUsecase>(
      (i) => FormatVaccinationRecordUsecaseI(),
    ),
    Bind.factory<FormatLastUpdateUsecase>(
      (i) => FormatLastUpdateUsecaseI(),
    ),
    Bind.factory<FormatGeneticsUsecase>(
      (i) => FormatGeneticsUsecaseI(),
    ),
     Bind.factory<FetchPetBloc>(
      (i) => FetchPetBloc(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:breed/p/', child: (_, args) {
      final id = args.queryParams['id'];
      if (id == null || id.isEmpty) return const NotFound404Page();
      return PetDetailsPage(id: id);
    }),
    ChildRoute('/:breed/gallery', child: (c, args) {
      final String breed = args.params['breed'];
      return GalleryPage(breed: breed);
    }),
  ];
}
