import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';

import 'package:dreampuppy/src/widgets/btn_loading.dart';
import 'package:dreampuppy/src/widgets/clean_checkbox_tile_widget.dart';

class CreateCreditCardFormPage extends StatefulWidget {
  const CreateCreditCardFormPage({super.key});

  @override
  State<CreateCreditCardFormPage> createState() =>
      _CreateCreditCardFormPageState();
}

class _CreateCreditCardFormPageState extends State<CreateCreditCardFormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController tName = TextEditingController();
  final TextEditingController tNum = TextEditingController();
  final TextEditingController tDate = TextEditingController();
  final TextEditingController tCVV = TextEditingController();

  bool saveCard = true;
  bool setAsDefault = true;

  createCard() {
    if (formKey.currentState?.validate() ?? false) {
      //TODO? Implementar a criação do cartão + Validação
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Preencha os dados do cartão',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            _CardFormWidget(
              formKey: formKey,
              tName: tName,
              tNum: tNum,
              tDate: tDate,
              tCVV: tCVV,
            ),
            const SizedBox(
              height: 16,
            ),
            //TODO: Implementar CheckboxListTile
            Column(
              children: [
                _SetSaveCardCheckboxWidget(
                  saveCard: saveCard,
                  onSaveChanged: (value) => saveCard = value,
                ),
                const SizedBox(
                  height: 8,
                ),
                _SetDefaultCardCheckboxWidget(
                  setAsDefault: setAsDefault,
                  onDefaultChanged: (value) => setAsDefault = value,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),

            //TODO: Replace by flat button
            BtnLoading(onPressed: null, label: "Cadastrar cartão"),
          ],
        ),
      ),
    );
  }
}

class _SetDefaultCardCheckboxWidget extends StatefulWidget {
  final bool setAsDefault;

  final Function(bool)? onDefaultChanged;

  const _SetDefaultCardCheckboxWidget({
    required this.setAsDefault,
    this.onDefaultChanged,
  });

  @override
  State<_SetDefaultCardCheckboxWidget> createState() =>
      _SetDefaultCardCheckboxWidgetState();
}

class _SetDefaultCardCheckboxWidgetState
    extends State<_SetDefaultCardCheckboxWidget> {
  late bool _defaultCard;

  @override
  void initState() {
    _defaultCard = widget.setAsDefault;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CleanCheckBoxTileWidget(
        therms: "Deseja definir como cartão principal?",
        value: _defaultCard,
        onChanged: (value) {
          if (value == null) return;
          setState(() {
            _defaultCard = value;
          });
          widget.onDefaultChanged?.call(value);
        });
  }
}

class _SetSaveCardCheckboxWidget extends StatefulWidget {
  final bool saveCard;
  final Function(bool)? onSaveChanged;

  const _SetSaveCardCheckboxWidget(
      {required this.saveCard, this.onSaveChanged});

  @override
  State<_SetSaveCardCheckboxWidget> createState() =>
      __SetSaveCardCheckboxWidgetState();
}

class __SetSaveCardCheckboxWidgetState
    extends State<_SetSaveCardCheckboxWidget> {
  late bool _saveCard;

  @override
  void initState() {
    _saveCard = widget.saveCard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CleanCheckBoxTileWidget(
      therms: "Deseja definir como cartão principal?",
      value: _saveCard,
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          _saveCard = value;
        });
        widget.onSaveChanged?.call(value);
      },
    );
  }
}

class _CardFormWidget extends StatelessWidget {
  _CardFormWidget({
    required this.tName,
    required this.tNum,
    required this.tDate,
    required this.tCVV,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController tName;
  final TextEditingController tNum;
  final TextEditingController tDate;
  final TextEditingController tCVV;

  final CreditCardValidator ccValidador = CreditCardValidator();

  int get cardNumberLengh => '0000 0000 0000 0000'.length;
  int get cardCVVLengh => '0000'.length;
  int get cardDateLengh => '04/23'.length;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
          SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
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
                const SizedBox(
                  width: 4,
                ),
                Expanded(
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
                      hintText: '0000',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
