abstract class UserAuthRepository{
  Future<String> login(String email, String password);
  Future<String> register(String email, String password);
  Future<void> logout();
  Future<String?> currentUser();
}