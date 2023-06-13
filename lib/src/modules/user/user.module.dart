import 'package:dreampuppy/src/modules/help/domain/usecases/about.dart';
import 'package:dreampuppy/src/modules/user/domain/auth/usecases/login.dart';
import 'package:dreampuppy/src/modules/user/presenter/view/auth/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/auth/repositories/authentication.dart';
import 'domain/auth/usecases/fetch_email.dart';
import 'domain/auth/usecases/forgot_password.dart';
import 'domain/auth/usecases/logout.dart';
import 'domain/auth/usecases/reset_password.dart';
import 'domain/auth/usecases/signup.dart';
import 'presenter/view/auth/login.dart';
import 'presenter/view/auth/reset_password.dart';
import 'external/datasources/firebase_auth.dart';
import 'infra/datasources/auth.dart';
import 'infra/repositories/authentication.dart';
import 'presenter/view/profile/profile.dart';

import 'presenter/view/credit_card/create_card.dart';

class UserModule extends Module {
  @override
  get binds => [
        // Auth
        Bind.lazySingleton((i) => FirebaseAuth.instance),
        Bind.lazySingleton<AuthDataSource>(
            (i) => FirebaseAuthDataSourceImpl(i())),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(i())),
        Bind.factory<SignInWithEmailAndPasswordUseCase>(
            (i) => SignInWithEmailAndPasswordUseCaseImpl(i())),
        Bind.factory<SignupUseCase>((i) => SignupUseCaseImpl(i())),
        Bind.factory<ForgotPasswordUseCase>(
            (i) => ForgotPasswordUseCaseImpl(i())),
        Bind.factory<ResetPasswordUseCase>(
            (i) => ResetPasswordUseCaseImpl(i())),
        Bind.factory<FetchEmailUseCase>((i) => FetchEmailUseCaseImpl(i())),
        //TODO: Provavelmente será exigido o uso do firebaseAuth
        Bind.factory<LogoutUseCase>((i) => LogoutUseCaseImpl(i())),
        // END Auth
        // Profile
        Bind.factory<OpenAboutUseCase>((i) => OpenAboutUseCaseImpl()),
      ];

  @override
  get routes => [
        ChildRoute('/', child: (c, a) => const UserProfilePage()),
        ChildRoute('/cards/create',
            child: (c, a) => const CreateCreditCardFormPage()),

        // Auth
        ChildRoute('/login', child: (c, a) => const LoginPage()),
        ChildRoute('/login/create', child: (c, a) => const RegisterPage()),
        ChildRoute('/login/reset-password',
            child: (_, args) => ResetPasswordPage(code: args.data['oobCode'])),

        // ChildRoute('/address/create', child: (c,a)=> const CreateAddressPage())
      ];
}
