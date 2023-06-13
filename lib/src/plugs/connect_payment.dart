import '../modules/payment/interfaces/navigation.dart';

/// Cria a conexão entre o módulo de pets e o módulo de pagamento.
class ConnectPaymentModuleExternalNavigation
    implements PaymentModuleExternalNavigation {
  @override
  onCartContinuePressed() {
    // final user = Modular.get<UserProvider>();
    // user.isLoggedIn ? Modular.to.pushNamed('/payment/cart') : Modular.to.pushNamed('/login');

    // TODO: implement onCartContinuePressed
    throw UnimplementedError();
  }
}
