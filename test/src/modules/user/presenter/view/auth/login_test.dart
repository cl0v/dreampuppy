import 'package:dreampuppy/main_app.module.dart';
import 'package:dreampuppy/src/modules/user/presenter/view/auth/login.dart';
import 'package:dreampuppy/src/modules/user/user.module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:patrol/patrol.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // setupFirebaseCoreMocks();
  final user = MockUser(
    isAnonymous: false,
    uid: 'someuid',
    email: 'bob@somedomain.com',
    displayName: 'Bob',
  );
  setUp(() {
    initModule(
      AppModule(),
    );
    initModule(UserModule(), replaceBinds: [
      Bind<FirebaseAuth>((i) => MockFirebaseAuth(mockUser: user)),
    ]);
  });
  patrolTest('Should redirect when login successful', ($) async {
    await $.pumpWidget(const MaterialApp(home: LoginPage()));
    await $(#email).enterText('email');
    await $(#password).enterText('senha');
    //TODO: Implementar linha abaixo
    // await $(#termsCheckbox).tap();
    await $(#btnLogin).tap();
    // await $('Email incorreto').waitUntilVisible();
    // Testar: btnRegister (navegação) / btnForgotPassword (abrirModal ou navegaçao)
  });
}
