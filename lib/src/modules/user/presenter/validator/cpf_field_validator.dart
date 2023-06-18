import 'package:cpf_cnpj_validator/cpf_validator.dart';

abstract class CPFFieldValidator {
  String? call(String? cpf);
}

class CPFFieldValidatorImpl implements CPFFieldValidator {
  @override
  String? call(String? cpf) {
    if (cpf == null || cpf.isEmpty) {
      return "Campo obrigatório";
    }
    if (cpf.length < 14) {
      return "Preencha todos os campos";
    }
    if (CPFValidator.isValid(cpf)) {
      return null;
    }
    return "CPF inválido";
  }
}
