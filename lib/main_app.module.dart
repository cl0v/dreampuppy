import 'package:dreampuppy/src/modules/user/presenter/view/address/create_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'src/providers/user.dart';
import 'src/modules/help/help.module.dart';
import 'src/modules/payment/payment.module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dreampuppy/src/modules/user/user.module.dart';
import 'package:dreampuppy/src/modules/pet/pets.module.dart';
import 'package:dreampuppy/src/modules/breed/breeds.module.dart';
import 'package:dreampuppy/src/modules/breed/presenter/view/breed_list_page.dart';

import 'src/modules/payment/interfaces/navigation.dart';
import 'src/modules/pet/plugs.dart';
import 'src/plugs/connect_payment.dart';
import 'src/plugs/connect_pet.dart';

class AppModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => FirebaseFirestore.instance),
        Bind.lazySingleton((i) => UserProvider()),

        // Modules External Navigators
        Bind.factory<PetModuleExternalNavigation>(
            (i) => ConnectPetModuleExternalNavigation()),
        Bind.factory<PaymentModuleExternalNavigation>(
            (i) => ConnectPaymentModuleExternalNavigation()),
      ];

  @override
  get routes => [
        ModuleRoute('/', module: BreedsModule()),
        // if (kDebugMode)
        //   ChildRoute('/',
        //       child: (context, args) => const PaymentUserRequirementsPage()),
        if (kDebugMode)
          ChildRoute('/', child: (context, args) => const FirstPage()),
        ChildRoute('/', child: (context, args) => const BreedListPage()),
        // ChildRoute('/', child: (context, args) => const CreditCardCreateFormPage()),
        ModuleRoute('/breeds', module: BreedsModule()),
        ModuleRoute('/pets', module: PetsModule()),
        ModuleRoute('/user', module: UserModule()),
        ModuleRoute('/payment', module: PaymentModule()),
        ModuleRoute('/help', module: HelpModule()),
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
            // onPressed: () => Modular.to.push(MaterialPageRoute(
            //     builder: (context) => const CreateAddressFormPage())),
            onPressed: () => Modular.to.pushNamed('/user/flow'),
            child: const Text('Go to module'),
          ),
        ),
      ),
    );
  }
}
