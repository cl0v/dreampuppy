import 'package:dreampuppy/src/features/profile/domain/usecases/needhelp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/view/user_profile_options.dart';

class ProfileModule extends Module {
  @override
  get binds => [
    Bind.factory<NeedHelpUseCase>((i) => NeedHelpUseCaseImpl())
  ];

  @override
  get routes => [
    ChildRoute('/', child: (c,a)=> const UserProfileOptionsView())
  ];
}