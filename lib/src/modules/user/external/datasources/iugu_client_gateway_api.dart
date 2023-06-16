import 'package:dreampuppy/src/modules/user/domain/address/entities/address.dart';

abstract class IuguUserGatewayApiDatasource {

  /// Cadastra o cliente, retornando o token do cliente no Gateway.
  Future<String> registerCustomer(String token, String email);
  
  /// Atribui um endereço ao cliente.
  Future<String> registerAddress(AddressEntity address, String customerId);
  
}