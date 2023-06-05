import 'package:dreampuppy/src/features/authentication/domain/repositories/user_auth.dart';

abstract class LogoutUseCase {
  Future<void> call();
}

class LogoutUseCaseImpl implements LogoutUseCase {
  final UserAuthRepository repository;

  LogoutUseCaseImpl(this.repository);

  @override
  call() => repository.logout();
}
