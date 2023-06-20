abstract class FormatGeneticsUsecase {
  String call(String? genetics);
}

class FormatGeneticsUsecaseI implements FormatGeneticsUsecase {
  @override
  String call(String? genetics) {
    return 'Genética: ${genetics ?? "Não informada"}';
  }
}
