import '../../../infra/repositories/app_rate.dart';

/// Avalia uma parte do App. e.g. Avalia a praticidade do App.
abstract class RateUseCase {
  call(String indentifyer, int rating);
}

class RateUseCaseImpl implements RateUseCase {
  final RateAppRepository repository;

  RateUseCaseImpl(this.repository);

  @override
  call(String indentifyer, int rating) {
    return repository.rate(indentifyer, rating);
  }
}
