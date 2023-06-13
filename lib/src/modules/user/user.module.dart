import 'package:dreampuppy/src/features/profile/domain/usecases/about.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../features/authentication/domain/usecases/logout.dart';
import 'presenter/view/profile.dart';

import 'presenter/view/credit_card/create.dart';

class UserModule extends Module {
  @override
  get binds => [
        Bind.factory<OpenAboutUseCase>((i) => OpenAboutUseCaseImpl()),
        //TODO: Provavelmente será exigido o uso do firebaseAuth
        Bind.factory<LogoutUseCase>((i) => LogoutUseCaseImpl(i())),
      ];

  @override
  get routes => [
        ChildRoute('/', child: (c, a) => const UserProfilePage()),
        ChildRoute('/cards/create',
            child: (c, a) => const CreditCardCreateFormPage()),
        // ChildRoute('/address/create', child: (c,a)=> const CreateAddressPage())
      ];
}
