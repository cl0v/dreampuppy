import 'package:dreampuppy/src/features/profile/domain/usecases/about.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../authentication/domain/usecases/logout.dart';
import 'presentation/view/user_profile_options.dart';

class UserModule extends Module {
  @override
  get binds => [
    Bind.factory<OpenAboutUseCase>((i) => OpenAboutUseCaseImpl()),
    //TODO: Provavelmente será exigido o uso do firebaseAuth
    Bind.factory<LogoutUseCase>((i) => LogoutUseCaseImpl(i())),
  ];

  @override
  get routes => [
    ChildRoute('/', child: (c,a)=> const UserProfileOptionsView()),
    // ChildRoute('/address/create', child: (c,a)=> const CreateAddressPage())
  ];
}