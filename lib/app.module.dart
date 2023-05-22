import 'package:dreampuppy/algolia_application.dart';
import 'package:dreampuppy/src/features/authentication/presentation/view/authentication.module.dart';
import 'package:dreampuppy/src/features/pet_list/presentation/view/pet_breed_list.dart';
import 'package:dreampuppy/src/features/breed_details/breed_details.module.dart';
import 'package:dreampuppy/src/features/profile/presentation/view/user_profile_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/domain/singletons/user.dart';
import 'src/features/pet_details/presentation/view/pet_details.dart';

class AppModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => AlgoliaApplication()),
        Bind.lazySingleton((i) => UserSingleton())
      ];

  @override
  get routes => [
        // ChildRoute('/', child: (context, args) => const PetBreedListPage()),
        ChildRoute('/',
            child: (context, args) =>  PetDetailsPage(
              statusBarColor: Colors.red[200]!,
                  images:const [
                    'https://cdn.midjourney.com/556701b5-4c48-4a0b-a3fd-5d51065faaca/0_0.png',
                    'https://cdn.midjourney.com/5fef3f23-3b2c-41eb-9432-8243ce4977a9/0_1.png',
                    'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
                    'https://hairstyleonpoint.com/wp-content/uploads/2015/09/4ce06e936dcd5e5c5c3e44be9edbc8ff.jpg',
                    'https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/11/full/1607656152-0479.jpg',
                    'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
                  ],
                )),
        ModuleRoute('/pets', module: BreedDetailsModule()),
        ModuleRoute('/login', module: AuthenticationModule()),
        ChildRoute('/profile', child: (c, a) => const UserProfileOptionsView())
      ];
}
