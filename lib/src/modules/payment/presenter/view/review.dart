import 'package:dreampuppy/src/features/authentication/presentation/components/btn_loading.dart';
import 'package:flutter/material.dart';

//TODO: Adicionar uma referência visual ao filhote que está sendo comprado.
// Uma imagem do filhote, e um pequeno texto será ótimo para manter o usuario com um desejo forte de concluir a compra.
//TODO: Adicionar uma ultima frase de impacto (e.g. "Você está prestes a mudar a sua vida pra melhor!")

/// Página onde o usuário irá revisar os dados de pagamento e irá confirmar a compra.
/// O usuário pode escolher entre pagar com cartão de crédito ou pix.
class PaymentReviewPage extends StatefulWidget {
  const PaymentReviewPage({super.key});

  @override
  State<PaymentReviewPage> createState() => _PaymentReviewPageState();
}

class _PaymentReviewPageState extends State<PaymentReviewPage> {
  onBtnPressed() {}

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
