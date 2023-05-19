import 'package:flutter_modular/flutter_modular.dart';

import 'login.dart';
import 'register.dart';

class AuthenticationModule extends Module{
   @override
  get binds => [];

  @override
  get routes => [
    ChildRoute('/', child: (c,a)=> LoginPage())
    ,ChildRoute('/register', child: (c,a)=> const RegisterPage())
  ];
}