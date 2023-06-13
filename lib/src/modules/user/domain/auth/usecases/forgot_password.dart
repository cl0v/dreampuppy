import '../repositories/authentication.dart';


/// Envia um email para o usuário com um link para resetar a senha.
abstract class ForgotPasswordUseCase {
  Future<void> call(String email);
}

class ForgotPasswordUseCaseImpl implements ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCaseImpl(this.repository);

  @override
  Future<void> call(String email) => repository.forgotPassword(email);
}