abstract class PaymentApiService {
  Future<String> createPayment(String token, String description, double amount);
  Future<String> registerCustomer(String token, String email);
  Future<String> registerCard(String token, String customerId);
}
