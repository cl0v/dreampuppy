import 'package:dreampuppy/src/modules/user/domain/auth/repositories/authentication.dart';

abstract class LogoutUseCase {
  Future<void> call();
}

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCaseImpl(this.repository);

  @override
  call() => repository.logout();
}
