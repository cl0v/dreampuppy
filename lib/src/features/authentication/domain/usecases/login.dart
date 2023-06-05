import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../errors/login_handler.dart';

abstract class LoginUseCase {
  Future<String> call(String email, String password);
}

class LoginUseCaseImpl implements LoginUseCase {
  final FirebaseAuth auth;

  LoginUseCaseImpl(this.auth);

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
