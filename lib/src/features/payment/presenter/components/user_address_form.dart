import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../authentication/presentation/components/custom_auth_text_field.dart';

class UserAddressFormComponent extends StatefulWidget {
  const UserAddressFormComponent({
    super.key,
    this.setFormKey,
  });

  final Function(GlobalKey<FormState>)? setFormKey;

  @override
  State<UserAddressFormComponent> createState() =>
      _UserAddressFormComponentState();
}

class _UserAddressFormComponentState
    extends State<UserAddressFormComponent> {
  final TextEditingController phoneController = TextEditingController(
    text: kDebugMode? "+55 (33) 99852-5199": null,
  );
  final TextEditingController cpfController = TextEditingController(
    text: kDebugMode? "098.470.316-06": null,
  );

  final _formKey = GlobalKey<FormState>();

  var phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    widget.setFormKey?.call(_formKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  "Precisamos de mais alguns dados para garantir a segurança da compra, favor preencha os campos.",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomAuthTextField(
                label: "Telefone | WhatsApp",
                padding: EdgeInsets.zero,
                hintText: "e.g (33) 99999-9999",
                controller: phoneController,
                masks: [phoneMaskFormatter],
                validator: (s) {
                  if (s == null || s.isEmpty || s.length < 9) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomAuthTextField(
                label: "CPF",
                masks: [cpfMaskFormatter],
                padding: EdgeInsets.zero,
                hintText: "e.g 000.000.000-00",
                controller: cpfController,
                validator: (s) {
                  if (s == null || s.isEmpty || s.length < 11) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
