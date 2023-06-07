abstract class RateUseCase {
  call(String indentifyer, int rating);
}

class RateUseCaseImpl implements RateUseCase {

  RateUseCaseImpl();

  @override
  call(String indentifyer, int rating) {
    print('$indentifyer: $rating');
  }
}

