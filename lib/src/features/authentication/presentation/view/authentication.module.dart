import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/usecases/login.dart';
import '../domain/usecases/signup.dart';
import 'login.dart';
import 'register.dart';

class AuthenticationModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => FirebaseAuth.instance),
        Bind.factory<LoginUseCase>((i) => LoginUseCaseImpl(i())),
        Bind.factory<SignupUseCase>((i) => SignupUseCaseImpl(i())),
      ];

  @override
  get routes => [
        ChildRoute('/', child: (c, a) => const LoginPage()),
        ChildRoute('/create', child: (c, a) => const RegisterPage())
      ];
}
