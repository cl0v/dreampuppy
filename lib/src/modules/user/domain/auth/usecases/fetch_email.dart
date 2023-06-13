import '../repositories/authentication.dart';

abstract class FetchEmailUseCase {
  Future<String> call(String code);
}

class FetchEmailUseCaseImpl implements FetchEmailUseCase {
  final AuthRepository repository;

  FetchEmailUseCaseImpl(this.repository);

  @override
  Future<String> call(String code) => repository.fetchEmailFromPasswordRecovery(code);
}