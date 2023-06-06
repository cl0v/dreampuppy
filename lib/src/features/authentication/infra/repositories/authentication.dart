import 'package:dreampuppy/src/features/authentication/domain/repositories/authentication.dart';

import '../datasources/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<String?> currentUser() => authDataSource.currentUser();

  @override
  Future<void> forgotPassword(String email) =>
      authDataSource.forgotPassword(email);

  @override
  Future<String> login(String email, String password) =>
      authDataSource.login(email, password);

  @override
  Future<void> logout() => authDataSource.logout();

  @override
  Future<String> register(String name, String email, String password) =>
      authDataSource.register(email, password);

  @override
  Future<void> resetPassword(String code, String password) =>
      authDataSource.resetPassword(code, password);

  @override
  Future<String> fetchEmailFromPasswordRecovery(String code) =>
      authDataSource.fetchPasswordRecoverEmail(code);
}
