import 'package:dreampuppy/algolia_application.dart';
import 'package:dreampuppy/src/features/authentication/presentation/view/authentication.module.dart';
import 'package:dreampuppy/src/features/pet_list/presentation/view/pet_breed_list.dart';
import 'package:dreampuppy/src/features/breed_details/breed_details.module.dart';
import 'package:dreampuppy/src/features/profile/presentation/view/user_profile_options.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/domain/singletons/user.dart';

class AppModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => AlgoliaApplication()),
        Bind.lazySingleton((i) => UserSingleton())
      ];

  @override
  get routes => [
        ChildRoute('/', child: (context, args) => const PetBreedListPage()),
        ModuleRoute('/pets', module: BreedDetailsModule()),
        ModuleRoute('/login', module: AuthenticationModule()),
        ChildRoute('/profile', child: (c, a) => const UserProfileOptionsView())
      ];
}
