abstract class RatingServiceDataSource {
  String? ratingDocId;

  Future<void> rate({
    required String feature,
    required int rating,
  });

  Future<void> comment(String comment);
}