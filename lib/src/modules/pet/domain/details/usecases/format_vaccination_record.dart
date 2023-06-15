import 'package:dreampuppy/src/modules/pet/domain/details/entities/pet.dart';

abstract class FormatVaccinationRecordUsecase {
  String call(VaccineRecord? record);
}

class FormatVaccinationRecordUsecaseI
    implements FormatVaccinationRecordUsecase {
  @override
  String call(VaccineRecord? record) {
    if (record == null) return 'Muito novo para vacinar';
    final amount = record.vaccines.length;
    String displayAmount = '';
    if (amount > 0) {
      displayAmount = '${amount}x';
    }
    return '$displayAmount ${record.vaccines.first.brand}';
  }
}
