abstract class AuthDataSource {
  String? get uuid;

  String? get userEmail;
  Future<String> login(String email, String password);
  Future<String> register(String email, String password);
  Future<void> logout();
  Future<void> forgotPassword(String email);
  Future<String> fetchPasswordRecoverEmail(String code);
  Future<void> resetPassword(String code, String password);
}
