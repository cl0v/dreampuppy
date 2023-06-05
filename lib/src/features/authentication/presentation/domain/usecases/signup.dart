import 'package:firebase_auth/firebase_auth.dart';
import '../errors/signup_handler.dart';

abstract class SignupUseCase {
  Future<String> call(String name, String email, String password, );
}

class SignupUseCaseImpl implements SignupUseCase {
  final FirebaseAuth auth;

  SignupUseCaseImpl(this.auth);
  @override
  Future<String> call(String name, String email, String password) async {
    try {
      final u = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return u.user!.uid;
      //TODO: Adicionar o primeiro registro do usuario, o nome email e uid
    } on FirebaseAuthException catch (e) {
      throw SignUpErrorHandler(e.code);
    }
  }
}
