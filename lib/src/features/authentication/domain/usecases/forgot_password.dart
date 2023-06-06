import '../repositories/authentication.dart';

abstract class ForgotPasswordUseCase {
  Future<void> call(String email);
}

class ForgotPasswordUseCaseImpl implements ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCaseImpl(this.repository);

  @override
  Future<void> call(String email) => repository.forgotPassword(email);
}