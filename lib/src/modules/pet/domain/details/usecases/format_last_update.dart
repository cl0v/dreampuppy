abstract class FormatLastUpdateUsecase {
  String call(DateTime? date);
}

class FormatLastUpdateUsecaseI implements FormatLastUpdateUsecase {
  @override
  String call(DateTime? date) {
    late final Duration diff;
    if (date == null) {
      diff = const Duration(days: 0);
    } else {
      diff = DateTime.now().difference(date);
    }
    return 'Atualizado há ${diff.inDays} dias';
  }
}
