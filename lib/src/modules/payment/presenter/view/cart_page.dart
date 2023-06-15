import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreampuppy/src/modules/payment/domain/cart/entities/cart_pet_card_entity.dart';
import 'package:dreampuppy/src/widgets/btn_loading.dart';
import 'package:dreampuppy/src/modules/payment/interfaces/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Recebe os dados de usuario e carrinho do provider

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
    required this.cardEntity,
  });

  final CartPetCardEntity cardEntity;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revisar pedido"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220,
              child: Card(
                child: Row(
                  children: [
                    Flexible(
                      flex: 8,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  'https://wallpapers.com/images/featured/wj7msvc5kj9v6cyy.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            const SizedBox(height: 8,),
                            const SizedBox(
                              height: 24,
                              child: Center(
                                  child: Text(
                                "Revise a descrição",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                            const SizedBox(height: 8,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(fontSize: 12),
                                  widget.cardEntity.resume,
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () => Modular.to.pop(),
                                child: const Text("Toque para trocar"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    "Os serviços de calculo de frete se encontram em desenvolvimento.",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "Para podermos te passar os valores do frete, precisamos de tempo para orçamentar com os TaxiDog que trabalham na região do canil, podendo oferecer variedade nos preços e datas de entrega."),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "Dito isso, vamos te contatar para te passar o valor do frete a parte, o qual será pago em outro momento, e não está incluso no valor do pedido."),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "Não se preocupe, o valor do frete é bem acessível, e você pode optar por não contratar o serviço de frete, e vir buscar o seu filhote no canil, ou contratar um serviço de frete de sua preferência."),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "Caso ainda não concordar com o valor do frete, você pode cancelar o pedido, e o valor pago será devolvido integralmente."),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "Todas as suas dúvidas serão sanadas no momento do contato."),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      "Obrigado pela compreensão!"),
                  const Text(textAlign: TextAlign.center, "Atenciosamente,"),
                  const Text(textAlign: TextAlign.center, "Equipe DreamPuppy"),
                  const SizedBox(
                    height: 36,
                  ),
                  BtnLoading(
                    onPressed: onContinuePressed,
                    label: "Continuar",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onContinuePressed() =>
      Modular.get<PaymentModuleExternalNavigation>().onCartContinuePressed();
}
