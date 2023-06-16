abstract class PaymentGatewayDatasource {
  /// Dispara o pagamento.
  Future<String> pay(String token, String description, double amount);

  /// Cadastra o cliente, retornando o token do cliente no Gateway.
  Future<String> registerCustomer(String token, String email);
  
  // TODO: Verificar quais parametros passar no registro de cartão de crédito.
  /// Cadastra o cartão de crédito, retornando o token do cartão.
  Future<String> registerCard(String token, String customerId);
}
