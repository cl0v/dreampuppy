import 'package:dreampuppy/src/modules/user/domain/auth/repositories/authentication.dart';

import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  String? get currentUserId => authDataSource.uuid;

  @override
  Future<void> forgotPassword(String email) =>
      authDataSource.forgotPassword(email);

  @override
  Future<String> login(String email, String password) =>
      authDataSource.login(email, password);

  @override
  Future<void> logout() => authDataSource.logout();

  @override
  Future<String> register(String email, String password) =>
      authDataSource.register(email, password);

  @override
  Future<void> resetPassword(String code, String password) =>
      authDataSource.resetPassword(code, password);

  @override
  Future<String> fetchEmailFromPasswordRecovery(String code) =>
      authDataSource.fetchPasswordRecoverEmail(code);

  @override
  String? get currentUserEmail => authDataSource.userEmail;
}
