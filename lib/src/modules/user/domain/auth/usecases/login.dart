import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../errors/login_error_handler.dart';

abstract class SignInWithEmailAndPasswordUseCase {
  /// Faz login com email e senha. Recebendo um UID no retorno.
  Future<String> call(String email, String password);
}

class SignInWithEmailAndPasswordUseCaseImpl
    implements SignInWithEmailAndPasswordUseCase {
  final FirebaseAuth auth;

  SignInWithEmailAndPasswordUseCaseImpl(this.auth);

  @override
  Future<String> call(e, p) async {
    try {
      final u = await auth.signInWithEmailAndPassword(
        email: e,
        password: p,
      );
      return u.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw LoginErrorHandler(e.code);
    } catch (e) {
      debugPrint('Provavelmente foi erro de nulo');
      rethrow;
    }
  }
}
