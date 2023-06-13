import '../repositories/authentication.dart';

abstract class ResetPasswordUseCase {
  Future<void> call(String code, String password);
}

class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCaseImpl(this.repository);

  @override
  Future<void> call(String code, String password) =>
      repository.resetPassword(code, password);
}
