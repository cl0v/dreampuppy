abstract class PaymentModuleExternalNavigation {
  /// Na tela de Revisão de pedido (/payment/cart),
  /// quando o usuário clicar em "Continuar" será chamado esse método.
  /// Ele é responsável por decidir qual rota tomar pra chegar na tela de pagamento.
  /// Pode ir para a tela de pagamento (Em que a pessoa escolhe endereço, forma de pagamento, etc)
  /// Pode ir para a tela de login (Em que a pessoa faz login e depois vai para a tela de pagamento)
  /// - Caso não tenha cadastro completo, vai para a tela de requirements.
  /// - Caso tenha cadastro completo, vai para a tela de pagamento.
  /// Pode ir para a tela de cadastro (Em que a pessoa faz cadastro e depois vai para a tela de completar cadastro [requirements]
  ///
  /// Navigate to the next route based on used credentials
  /// If the user is logged in. Then the user sensitive date will be checked.
  onCartContinuePressed();
}
