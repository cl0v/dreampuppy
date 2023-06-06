import 'package:dreampuppy/src/features/authentication/domain/repositories/authentication.dart';

abstract class LogoutUseCase {
  Future<void> call();
}

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCaseImpl(this.repository);

  @override
  call() => repository.logout();
}
