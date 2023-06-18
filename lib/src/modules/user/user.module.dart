import 'package:dreampuppy/src/modules/help/domain/usecases/about.dart';
import 'package:dreampuppy/src/modules/user/domain/auth/usecases/login.dart';
import 'package:dreampuppy/src/modules/user/external/datasources/firestore_user.dart';
import 'package:dreampuppy/src/modules/user/presenter/validator/cpf_field_validator.dart';
import 'package:dreampuppy/src/modules/user/presenter/view/auth/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/auth/repositories/authentication.dart';
import 'domain/auth/usecases/fetch_email.dart';
import 'domain/auth/usecases/forgot_password.dart';
import 'domain/auth/usecases/logout.dart';
import 'domain/auth/usecases/reset_password.dart';
import 'domain/auth/usecases/signup.dart';
import 'domain/profile/usecases/submit_user_sensitive_data_form.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repositories/user_repository.dart';
import 'presenter/controller/auth/auth_controller.dart';
import 'presenter/view/auth/login.dart';
import 'presenter/view/auth/reset_password.dart';
import 'external/datasources/firebase_auth.dart';
import 'infra/datasources/auth_datasource.dart';
import 'infra/repositories/authentication.dart';
import 'presenter/view/profile/sensitive_data_form_page.dart';
import 'presenter/view/profile/profile.dart';
import 'presenter/view/credit_card/create_card.dart';
import 'presenter/view/address/create_address_page.dart';
import 'presenter/view/minimum_registration_view.dart';

class UserModule extends Module {
  @override
  get binds => [
        // auth
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
        Bind.factory<AuthController>((i) => AuthController()),

        //TODO: Provavelmente será exigido o uso do firebaseAuth
        Bind.factory<LogoutUseCase>((i) => LogoutUseCaseImpl(i())),
        // END auth
        // profile
        Bind.lazySingleton<IUserDataSource>(
          (i) => FirestoreUserDataSourceI(i()),
        ),
        Bind.lazySingleton<IUserRepository>(
          (i) => UserRepositoryI(i()),
        ),
        Bind.factory<SubmitUserSensitiveDataFormUsecase>(
          (i) => SubmitUserSensitiveDataFormUsecaseI(i(), i()),
        ),
        Bind.factory<OpenAboutUseCase>(
          (i) => OpenAboutUseCaseImpl(),
        ),
        // FieldsValidators
        Bind.factory<CPFFieldValidator>((i) => CPFFieldValidatorImpl()),
        // EndValidators
        // END rofile
      ];

  @override
  get routes => [
        ChildRoute('/', child: (c, a) => const UserProfilePage()),
        ChildRoute('/profile/create',
            child: (c, a) => const UserSensitiveDataFormPage()),
        ChildRoute('/cards/create',
            child: (c, a) => const CreateCreditCardFormPage()),
        ChildRoute('/address/create',
            child: (c, a) => const CreateAddressFormPage()),

        // Auth
        ChildRoute('/login', child: (c, a) => const LoginPage()),
        ChildRoute('/login/create', child: (c, a) => const RegisterPage()),
        //TODO: Adicionar uma página para solicitar reset de senha. (É bem mais facil a utilização).
        // ChildRoute('/login/request-password-reset',
        //     child: (_, args) => ResetPasswordPage()),
        ChildRoute('/login/_password-reset',
            child: (_, args) => ResetPasswordPage(code: args.data['oobCode'])),
        // END Auth

        ChildRoute('/flow',
            child: (_, __) => const UserMinimumRequirementsView()),
        // ChildRoute('/address/create', child: (c,a)=> const CreateAddressPage())
      ];
}
