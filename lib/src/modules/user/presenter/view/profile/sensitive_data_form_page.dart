import 'package:dreampuppy/src/modules/user/domain/profile/entities/user_sensitive_data.dart';
import 'package:dreampuppy/src/modules/user/presenter/validator/cpf_field_validator.dart';
import 'package:dreampuppy/src/widgets/btn_loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../domain/profile/usecases/submit_user_sensitive_data_form.dart';

/// Formulário que deverá ser preenchido para garantir que é um usuário humano.
class UserSensitiveDataFormPage extends StatefulWidget {
  const UserSensitiveDataFormPage({
    super.key,
    this.onSuccess,
  });

  final Function? onSuccess;

  @override
  State<UserSensitiveDataFormPage> createState() =>
      _UserSensitiveDataFormPageState();
}

class _UserSensitiveDataFormPageState extends State<UserSensitiveDataFormPage> {
  final TextEditingController fullNameController = TextEditingController(
    text: kDebugMode ? "Marcelo Fernandes Viana" : null,
  );
  // final TextEditingController phoneController = TextEditingController(
  //     // text: kDebugMode ? "+55 (33) 99852-5199" : null,
  //     );
  // final TextEditingController cpfController = TextEditingController(
  //     // text: kDebugMode ? "098.470.316-06" : null,
  //     );

  final _formKey = GlobalKey<FormState>();

  var phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  var cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  late final submitUserSensitiveDataFromUsecase =
      Modular.get<SubmitUserSensitiveDataFormUsecase>();
  late final cpfValidador = Modular.get<CPFFieldValidator>();

  onSensitiveDataFormSubmit() {
    if (_formKey.currentState!.validate()) {
      final fullName = fullNameController.text;
      final phone = phoneMaskFormatter.getUnmaskedText();
      final cpf = cpfMaskFormatter.getUnmaskedText();

      submitUserSensitiveDataFromUsecase(
        UserSensitiveDataEntity(
          name: fullName,
          phone: phone,
          cpf: cpf,
        ),
      );
      if (widget.onSuccess == null) {
        return Modular.to.pop();
      } else {
        return widget.onSuccess?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de usuário"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OccludeWrapper(
              child: CustomTextFieldWidget(
                label: "Nome completo",
                controller: fullNameController,
                hintText: 'Seu nome completo',
                validator: (value) {
                  if (value == null) {
                    print("Valor é nulo, investigar essa situação");
                  }
                  if (value!.isEmpty) {
                    return 'Digite um nome válido';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
            OccludeWrapper(
              child: CustomTextFieldWidget(
                label: "Telefone | WhatsApp",
                hintText: "e.g (11) 90000-0000",
                type: TextInputType.number,
                // controller: phoneController,
                masks: [phoneMaskFormatter],
                validator: (s) {
                  if (s == null || s.isEmpty || s.length < 9) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            OccludeWrapper(
              child: CustomTextFieldWidget(
                label: "CPF",
                masks: [cpfMaskFormatter],
                hintText: "e.g 000.000.000-00",
                type: TextInputType.number,
                // controller: cpfController,
                validator: cpfValidador.call,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            BtnLoading(
              onPressed: onSensitiveDataFormSubmit,
              label: 'Continuar',
            )
          ],
        ),
      ),
    );
  }
}
