import 'package:dreampuppy/src/widgets/btn_loading.dart';
import 'package:dreampuppy/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../domain/address/usecases/create_address.dart';

class CreateAddressFormPage extends StatefulWidget {
  const CreateAddressFormPage({
    super.key,
    this.onSuccess,
  });

  final Function? onSuccess;

  @override
  State<CreateAddressFormPage> createState() => _CreateAddressFormPageState();
}

class _CreateAddressFormPageState extends State<CreateAddressFormPage> {
  late final createAddressUsecase = Modular.get<CreateAddressUsecase>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var cepMaskFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Endereço'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton.icon(
                      onPressed:
                          null, //TODO: Exibir a lista de endereços disponíveis, caso possua algum.
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 12,
                      ),
                      label: const Text("Lista de endereços"),
                    ),
                  ),
                  // TODO: Adicionar uma nota, avisando que o endereço é para entregar o filhote e para garantir a segurança do pagamento.
                  // TODO: Estudar se essa nota poderia ficar por aqui, seria muita leitura pro usuário, podendo ficar no contrato.
                  // TODO: Adicionar nota: "Detalhes do endereço podem ser encotrados na Clausula 7 do contrato".
                  CustomTextFieldWidget(
                    padding: EdgeInsets.zero,
                    hintText: '00000-000',
                    label: 'CEP',
                    masks: [
                      cepMaskFormatter,
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: CustomTextFieldWidget(
                          padding: EdgeInsets.zero,
                          hintText: 'Rua dos Pugs, Apto Dalmatas',
                          label: 'Endereço',
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomTextFieldWidget(
                          padding: EdgeInsets.zero,
                          hintText: '101',
                          label: 'Número',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    child: CustomTextFieldWidget(
                      padding: EdgeInsets.zero,
                      hintText: 'e.g. Próximo ao petshop do João',
                      label: 'Referência',
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomTextFieldWidget(
                    padding: EdgeInsets.zero,
                    hintText: 'Marley',
                    label: 'Bairro',
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: CustomTextFieldWidget(
                          padding: EdgeInsets.zero,
                          hintText: 'e.g. São Paulo',
                          label: 'Cidade',
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomTextFieldWidget(
                          padding: EdgeInsets.zero,
                          hintText: 'SP',
                          label: 'UF',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const Text("Consulte a cláusula 7 para saber mais"),
                  const SizedBox(
                    height: 26,
                  ),
                  BtnLoading(
                    onPressed: () {},
                    label: 'Cadastrar e continuar',
                    margin: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
