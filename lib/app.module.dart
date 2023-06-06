import 'package:dreampuppy/src/features/pet_details/pets.module.dart';
import 'package:dreampuppy/src/features/pet_list/presentation/view/breed_list.dart';
import 'package:dreampuppy/src/features/profile/profile.module.dart';
import 'src/_domain/singletons/user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/features/breed_details/breed_details.module.dart';
import 'src/features/pet_list/features/search_others/presentation/view/breed_priority_survey.dart';
import 'package:dreampuppy/src/features/authentication/authentication.module.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/infra/datasources/search.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/infra/repositories/search.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/domain/usecases/save_search.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/external/datasources/search.dart';

class AppModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => FirebaseFirestore.instance),
        Bind.lazySingleton((i) => UserSingleton()),
        Bind.factory<SearchDataSource>((i) => SearchDataSourceImpl(i())),
        Bind.factory<SearchRepository>((i) => SearchRepositoryImpl(i())),
        Bind.factory<SaveSearchUseCase>((i) => SaveSearchUseCaseImpl(i())),
      ];

  @override
  get routes => [
        ChildRoute('/', child: (context, args) => const BreedListPage()),
        // ChildRoute('/', child: (context, args) => const BreedListPage()),
        ChildRoute('/breed_priority_research',
            child: (context, args) => const BreedPrioritySurveyPage()),
        ModuleRoute('/profile', module: ProfileModule()),
        ModuleRoute('/pet', module: PetsModule()),
        ModuleRoute('/breeds', module: BreedDetailsModule()),
        ModuleRoute('/login', module: AuthenticationModule()),
      ];
}
