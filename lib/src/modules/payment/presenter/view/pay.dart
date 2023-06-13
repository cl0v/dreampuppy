import 'package:dreampuppy/src/widgets/btn_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../widgets/clean_checkbox_tile_widget.dart';
import '../../domain/pay/usecases/pay_with_credit_card.dart';

//TODO: Adicionar uma referência visual ao filhote que está sendo comprado.
// Uma imagem do filhote, e um pequeno texto será ótimo para manter o usuario com um desejo forte de concluir a compra.
//TODO: Adicionar uma ultima frase de impacto (e.g. "Você está prestes a mudar a sua vida pra melhor!")

/// Página onde o usuário irá revisar os dados de pagamento e irá confirmar a compra.
/// O usuário pode escolher entre pagar com cartão de crédito ou pix.
class PaymentPayPage extends StatefulWidget {
  const PaymentPayPage({super.key});

  @override
  State<PaymentPayPage> createState() => _PaymentPayPageState();
}

class _PaymentPayPageState extends State<PaymentPayPage> {
  bool jurado = false;

  late final payWithCreditCardUseCase = Modular.get<PayWithCreditCardUseCase>();

  onBtnPressed() {
    if (!jurado) return Fluttertoast.showToast(msg: "Você deve jurar!");
    // Implementar usecase
    // Caso seja pix, exibe a página do pix
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revise as informações"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text("Praça Paris, 01, Centro, Rio de Janeiro - RJ"),
                    subtitle: const Text("Toque para alterar o endereço"),
                    leading: const Icon(Icons.location_on),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                        "Cartão de crédito (x1)"), // Pix Ou Cartão de crédito (x12)
                    subtitle:
                        const Text("Toque para alterar a forma de pagamento"),
                    leading: const Icon(Icons.payment_outlined),
                  ),
                ),
              ],
            ),
            _SafetyJura(onJura: (v) => jurado = v),
            Column(
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Você será redirecionado para o ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "WhatsApp",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "após a conclusão do pagamento.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ])),
                const SizedBox(
                  height: 18,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text:
                            "Será combinado com mais detalhes a entrega, assim como a emissão do documento de ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Pedigree",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ".",
                            style: TextStyle(color: Colors.black),
                          ),
                        ])),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Por favor sinta-se a vontade para sanar todas as suas dúvidas.",
                ),
              ],
            ),
            BtnLoading(
              onPressed: () => onBtnPressed(),
              label: "Confirmar compra",
            ),
          ],
        ),
      ),
    );
  }
}

class _SafetyJura extends StatefulWidget {
  const _SafetyJura({required this.onJura});
  final Function(bool) onJura;

  @override
  State<_SafetyJura> createState() => _SafetyJuraState();
}

class _SafetyJuraState extends State<_SafetyJura> {
  bool _jura = false;

  @override
  Widget build(BuildContext context) {
    return CleanCheckBoxTileWidget(
      therms:
          "Prometo cuidar desse filhote com todo o meu amor, independente das condições, até que a morte nos separe.",
      value: _jura,
      onChanged: (v) {
        if (v == null) return;
        setState(() {
          _jura = v;
        });
        widget.onJura(v);
      },
    );
  }
}
