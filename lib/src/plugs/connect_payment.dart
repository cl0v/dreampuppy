import 'package:flutter_modular/flutter_modular.dart';

import '../modules/payment/interfaces/navigation.dart';
import '../providers/user.dart';

/// Cria a conexão entre o módulo de pets e o módulo de pagamento.
class ConnectPaymentModuleExternalNavigation
    implements PaymentModuleExternalNavigation {
  @override
  onCartContinuePressed() {
    // final user = Modular.get<UserProvider>();
    // if (user.id == null) {
    //   return Modular.to.pushNamed('/user/login/create');
    // } else if (user.sensitiveDataRequired) {
    //   return Modular.to.pushNamed('/user/profile/create');
    // }
    // else if (user.addressResume == null) {
    //   return Modular.to.pushNamed('/user/address/create');
    // } else if(user.defaultCardToken == null){
    //   return Modular.to.pushNamed('/user/card/create');
    // }
    return Modular.to.pushNamed('/user/flow');
  }
}
