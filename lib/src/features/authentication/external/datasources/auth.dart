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
}
