import 'package:dreampuppy/src/features/payment/infra/datasources/rating_service.dart';

abstract class RateRepository {
  Future<void> rate(String indentifyer, int rating);

  Future<void> comment(String from, String comment);
}

class RateRepositoryImpl implements RateRepository {
  final RatingServiceDataSource dataSource;

  RateRepositoryImpl(this.dataSource);

  @override
  Future<void> rate(String indentifyer, int rating) {
    return dataSource.rate(
      feature: indentifyer,
      rating: rating,
    );
  }
  
  @override
   comment(String from, String comment) {
    return dataSource.comment(from, comment);
  }
}