import 'package:dreampuppy/src/modules/payment/infra/datasources/app_rating_service.dart';

abstract class RateAppRepository {
  Future<void> rate(String indentifyer, int rating);

  Future<void> comment(String from, String comment);
}

class RateAppRepositoryImpl implements RateAppRepository {
  final AppRatingServiceDataSource dataSource;

  RateAppRepositoryImpl(this.dataSource);

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
