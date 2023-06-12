import 'package:dreampuppy/src/features/authentication/domain/usecases/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/repositories/authentication.dart';
import 'domain/usecases/fetch_email.dart';
import 'domain/usecases/login.dart';
import 'domain/usecases/reset_password.dart';
import 'domain/usecases/signup.dart';
import 'external/datasources/firebase_auth.dart';
import 'infra/datasources/auth.dart';
import 'infra/repositories/authentication.dart';
import 'presentation/view/login.dart';
import 'presentation/view/register.dart';
import 'presentation/view/reset_password.dart';


// root: /login
class AuthenticationModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => FirebaseAuth.instance),
        Bind.factory<AuthRepository>((i) => AuthRepositoryImpl(i())),
        Bind.factory<AuthDataSource>((i) => FirebaseAuthDataSourceImpl(i())),
        Bind.factory<LoginUseCase>((i) => LoginUseCaseImpl(i())),
        Bind.factory<SignupUseCase>((i) => SignupUseCaseImpl(i())),
        Bind.factory<ForgotPasswordUseCase>((i) => ForgotPasswordUseCaseImpl(i())),
        Bind.factory<ResetPasswordUseCase>((i) => ResetPasswordUseCaseImpl(i())),
        Bind.factory<FetchEmailUseCase>((i) => FetchEmailUseCaseImpl(i())),
      ];

  @override
  get routes => [
        ChildRoute('/', child: (c, a) => const LoginPage()),
        ChildRoute('/create',
            child: (c, a) => RegisterPage(
                  onRedirect: a.data['onCreate'],
                )),
        ChildRoute('/reset-password', child: (_, args)=> ResetPasswordPage(code: args.data['oobCode'])),
      ];
}
