abstract class FormatGeneticsUsecase {
  String call(String? genetics);
}

class FormatGeneticsUsecaseI implements FormatGeneticsUsecase {
  @override
  String call(String? genetics) {
    if (genetics == null) return 'Genética não informada';
    return genetics;
  }
}