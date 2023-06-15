import 'package:dreampuppy/src/modules/user/interface/navigation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConnectUserAuthNavigation implements AuthNavigation {
  @override
  onAuth(AuthFromRoute from) {
    switch (from) {
      case AuthFromRoute.cart:
        // verificar status de cadastro.
        break;
      case AuthFromRoute.profile:
        return Modular.to.pop();
        
    }
  }
}
