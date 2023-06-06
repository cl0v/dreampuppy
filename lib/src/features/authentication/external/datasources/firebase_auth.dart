import 'package:dreampuppy/src/features/authentication/infra/datasources/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/errors/login_handler.dart';
import '../../domain/errors/signup_handler.dart';

/// Todas as responsabilidade do firebaseAuth estão encapsuladas no Auth
/// Mais:  https://firebase.flutter.dev/docs/auth/usage/

class FirebaseAuthDataSourceImpl implements AuthDataSource {
  late final FirebaseAuth auth;

  FirebaseAuthDataSourceImpl(this.auth);

  @override
  Future<String?> currentUser() => Future.value(auth.currentUser?.uid);

  @override
  Future<String> login(String email, String password) async {
    try {
      final u = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return u.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw LoginErrorHandler(e.code);
    }
  }

  @override
  Future<String> register(String email, String password) async {
    try {
      final u = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return u.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw SignUpErrorHandler(e.code);
    }
  }

  @override
  Future<void> logout() => auth.signOut();


  @override
  //TODO: Implementar todas as possíveis exceções
  Future<String> fetchPasswordRecoverEmail(String code) =>
      auth.verifyPasswordResetCode(code);

  @override
  //TODO: Implementar todas as possíveis exceções
  Future<void> forgotPassword(String email) =>
      auth.sendPasswordResetEmail(email: email);

  @override
  //TODO: Implementar todas as possíveis exceções
  Future<void> resetPassword(String code, String password) =>
      auth.confirmPasswordReset(code: code, newPassword: password);
}
