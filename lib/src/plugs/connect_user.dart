import 'package:dreampuppy/src/modules/user/interface/navigation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConnectUserAuthNavigation implements AuthNavigation {
  @override
  onLogin(String email, String uuid) {
    if (_navigateToCreateProfile(email, uuid)) return;
  }

  @override
  Future<void> onRegister(String email, String uuid) async {
    Modular.to.pushReplacementNamed(
      '/user/profile/create',
      arguments: {
        'email': email,
        'uuid': uuid,
      },
    );
  }

  _navigateToCreateProfile(String email, String uuid) {
    // Verificar se o user precisa de um cadastro.
    Modular.to.pushReplacementNamed(
      '/user/profile/create',
      arguments: {
        'email': email,
        'uuid': uuid,
      },
    );
  }
}
