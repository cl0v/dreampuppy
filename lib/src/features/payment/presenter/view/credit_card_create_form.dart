import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';

class CreditCardCreateFormPage extends StatefulWidget {
  const CreditCardCreateFormPage({super.key});

  @override
  State<CreditCardCreateFormPage> createState() =>
      _CreditCardCreateFormPageState();
}

class _CreditCardCreateFormPageState extends State<CreditCardCreateFormPage> {
  final TextEditingController tName = TextEditingController();
  final TextEditingController tNum = TextEditingController();
  final TextEditingController tDate = TextEditingController();
  final TextEditingController tCVV = TextEditingController();

  final CreditCardValidator ccValidador = CreditCardValidator();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int get cardNumberLengh => '0000 0000 0000 0000'.length;
  int get cardCVVLengh => '0000'.length;
  int get cardDateLengh => '04/23'.length;

  validate() {
    if (formKey.currentState?.validate() ?? false) {
      //TODO? Implementar a criação do cartão + Validação
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Placeholder(
              child: Text(
                'Preencha os dados do cartão',
                style: textTheme.headline5,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      keyboardType: TextInputType.name,
                      controller: tName,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 5) {
                          return 'Nome invalido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        hintText: 'Maria da Silva',
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.length == cardNumberLengh) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: tNum,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !ccValidador.validateCCNum(value).isValid) {
                          return 'Número do cartão invalido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Número',
                          hintText: 'XXXX XXXX XXXX XXXX'),
                      // inputFormatters: [CustomMasks.creditCardMask],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth * 2 / 4,
                          child: TextFormField(
                            controller: tDate,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value.length == cardDateLengh) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !ccValidador.validateExpDate(value).isValid) {
                                return 'Confira a data de validade';
                              }
                              return null;
                            },
                            // inputFormatters: [CustomMasks.expirationDateMask],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Validade',
                              hintText: '04/23',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 1 / 4,
                          child: TextFormField(
                            controller: tCVV,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value.length == cardCVVLengh) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'CVV invalido';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'CVV',
                                hintText: '0000'),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),const SizedBox(
              height: 12,
            ),
            //TODO: Implementar CheckboxListTile
                SizedBox(
                  height: 24,
                  child: Placeholder(
                    child: Center(
                      child: Text("Deseja definir como cartão principal?"),
                    ),
                  ),
                ),
            const SizedBox(
              height: 32,
            ),


            //TODO: Replace by flat button 
            SizedBox(
                height: 56,
                child: const Placeholder(
                    child: Center(child: Text("Cadastrar cartão"))))
          ],
        ),
      ),
    );
  }
}
