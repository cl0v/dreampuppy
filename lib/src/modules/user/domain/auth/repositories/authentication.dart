abstract class AuthRepository {
  /// Returns a [Future] that resolves to a [String] containing the user's token.
  Future<String> login(String email, String password);

  /// Returns a [Future] that resolves to a [String] containing the user's token.
  Future<String> register(String email, String password);

  /// Calls the Firebase API to send a password reset email to the user.
  Future<void> forgotPassword(String email);

  /// Calls the Firebase API to reset the user's password.
  Future<void> resetPassword(String code, String password);

  /// Calls the Firebase API to fetch the user's email from reset code.
  Future<String> fetchEmailFromPasswordRecovery(String code);

  /// Calls the Firebase API to sign out the current user.
  Future<void> logout();

  /// Returns a [Future] that resolves to a [String] containing the user's token. [null] if the user is not logged in.
  String? get currentUserId;

  /// Returns a [Future] that resolves to a [String] containing the user's email. [null] if the user is not logged in.
  String? get currentUserEmail;
}
