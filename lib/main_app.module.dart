import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'src/_domain/singletons/user.dart';
import 'src/modules/payment/payment.module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dreampuppy/src/modules/user/user.module.dart';
import 'src/features/profile/domain/usecases/request_contact.dart';
import 'package:dreampuppy/src/modules/pet/pets.module.dart';
import 'package:dreampuppy/src/features/help_center/presenter/view/wiki.dart';
import 'package:dreampuppy/src/modules/breed/breeds.module.dart';
import 'package:dreampuppy/src/modules/payment/presenter/view/requirements.dart';
import 'package:dreampuppy/src/features/authentication/authentication.module.dart';
import 'package:dreampuppy/src/features/pet_list/presentation/view/breed_list.dart';
import 'src/features/pet_list/features/search_others/presentation/view/breed_priority_survey.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/infra/datasources/search.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/infra/repositories/search.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/domain/usecases/save_search.dart';
import 'package:dreampuppy/src/features/pet_list/features/search_others/external/datasources/search.dart';

import 'src/modules/payment/external.dart';
import 'src/modules/pet/plugs.dart';
import 'src/plugs/connect_payment.dart';
import 'src/plugs/connect_pet.dart';

class AppModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => FirebaseFirestore.instance),
        Bind.lazySingleton((i) => UserSingleton()),
        Bind.factory<SearchDataSource>((i) => SearchDataSourceImpl(i())),
        Bind.factory<SearchRepository>((i) => SearchRepositoryImpl(i())),
        Bind.factory<SaveSearchUseCase>((i) => SaveSearchUseCaseImpl(i())),
        Bind.factory<RequestContactUseCase>(
            (i) => WhatsAppContactUseCaseImpl()),

        // Modules External Navigators
        Bind.factory<PetModuleExternalNavigation>(
            (i) => ConnectPetModuleExternalNavigation()),
        Bind.factory<PaymentModuleExternalNavigation>(
            (i) => ConnectPaymentModuleExternalNavigation()),
      ];

  @override
  get routes => [
        ModuleRoute('/', module: BreedsModule()),
        if (kDebugMode)
          ChildRoute('/',
              child: (context, args) => const PaymentUserRequirementsPage()),
        if (kDebugMode)
        ChildRoute('/', child: (context, args) => const BreedListPage()),
        ChildRoute('/', child: (context, args) => const FirstPage()),
        // ChildRoute('/', child: (context, args) => const CreditCardCreateFormPage()),
        ChildRoute('/breed_priority_research',
            child: (context, args) => const BreedPrioritySurveyPage()),
        ChildRoute('/help', child: (context, args) => const HelpCenterPage()),
        ModuleRoute('/pet', module: PetsModule()),
        ModuleRoute('/user', module: UserModule()),
        ModuleRoute('/login', module: AuthenticationModule()),
        ModuleRoute('/breeds', module: BreedsModule()),
        ModuleRoute('/payment', module: PaymentModule()),
      ];
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => Modular.to.pushNamed('/user/cards/create'),
            child: const Text('Go to module'),
          ),
        ),
      ),
    );
  }
}
