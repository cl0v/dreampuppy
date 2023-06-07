import '../../infra/repositories/rate.dart';

abstract class RateUseCase {
  call(String indentifyer, int rating);
}

class RateUseCaseImpl implements RateUseCase {
  final RateRepository repository;

  RateUseCaseImpl(this.repository);

  @override
  call(String indentifyer, int rating) {
    return repository.rate(indentifyer, rating);
  }
}
