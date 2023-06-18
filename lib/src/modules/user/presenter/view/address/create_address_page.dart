import 'package:dreampuppy/src/widgets/btn_loading.dart';
import 'package:dreampuppy/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../domain/address/entities/address.dart';
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

  final TextEditingController streetController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  var cepMaskFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  var ufStateMaskFormatter = MaskTextInputFormatter(
    mask: '##',
    filter: {"#": RegExp(r'[a-zA-Z]')},
    type: MaskAutoCompletionType.eager,
  );

  createAddress() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final uf = ufStateMaskFormatter.getMaskedText().toUpperCase();
      await createAddressUsecase(
        AddressEntity(
          street: streetController.text,
          num: numberController.text,
          district: districtController.text,
          complement: referenceController.text,
          city: cityController.text,
          stateUf: uf.isEmpty ? 'SN' : uf,
          cep: cepMaskFormatter.getUnmaskedText(),
        ),
      );
      widget.onSuccess!();
    }
  }

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
                
                  
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: CustomTextFieldWidget(
                          padding: EdgeInsets.zero,
                          hintText: 'Rua dos Pugs, Apto Dalmatas',
                          label: 'Endereço',
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
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
                          type: TextInputType.number,
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
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
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
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
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
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                          masks: [
                            ufStateMaskFormatter,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                    CustomTextFieldWidget(
                    padding: EdgeInsets.zero,
                    type: TextInputType.number,
                    hintText: '00000-000',
                    label: 'CEP',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty || p0.length < 9) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                    masks: [
                      cepMaskFormatter,
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
                    onPressed: createAddress,
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
