import 'package:dreampuppy/src/_infra/datasources/pet.dart';
import 'package:dreampuppy/src/_infra/repositories/pet.dart';
import 'package:dreampuppy/src/external/datasources/firestore_pet.dart';
import 'package:dreampuppy/src/features/breed_details/presentation/view/breed_details.dart';
import 'package:dreampuppy/src/features/gallery/presentation/view/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../algolia_application.dart';
import 'domain/usecases/fetch_pet.dart';
import 'presentation/bloc/fetch_pet.dart';
import 'presentation/view/pet_details.dart';

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
    ChildRoute('/:breed',
        //TODO: Implementar página de filtros antes de ir para a galeria.
        child: (_, args) {
      final String breed = args.params['breed'];
      if (breed.isEmpty) {
        //TODO: Show 404
        print("#TODO: Exibir 404");
      }
      return Container();
      // return TelaGenero(
      //  breed: args.params['breed'],
      //   );
    }),
    ChildRoute('/:breed/gallery', child: (c, args) {
      return GalleryPage(
        //TODO: Traduzir o Breed de volta para o nome da raça
        breed: args.params['breed'],
      );
    }),
    //TODO: O about será uma lista de informações sobre a raça. Podendo dar à opção de ir direto para a aplicação dos filtros (Fluxo de compras)
    ChildRoute('/:breed/about',
        child: (c, args) => BreedDetailsPage(
              breed: args.params['breed'],
            )),

    ChildRoute('/p/:id',
        child: (_, args) => PetDetailsPage(
              id: args.params['id'],
              pet: args.data,
            )),
  ];
}
