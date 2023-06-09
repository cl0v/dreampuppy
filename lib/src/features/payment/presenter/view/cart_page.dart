import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Recebe os dados de usuario e carrinho do provider

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: GestureDetector(
        onTap: () => Modular.to.pushNamed('/login/create',
            arguments: () => Modular.to.pushNamed('/user/address/create')),
        child: const SizedBox(
          height: 56,
          child: Placeholder(child: Center(child: Text('Proceed to checkout'))),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220,
              child: Card(
                // child: Row(
                //   children: <Widget>[
                //     Flexible(
                //       flex: 1,
                //       child: Placeholder(),
                //     ),
                //     Flexible(
                //       flex: 2,
                //       child: Column(
                //         children: <Widget>[
                child: Placeholder(
                  strokeWidth: 0,
                  color: Colors.red,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 8,
                        child: Placeholder(
                          child: Center(
                            child: Text("Foto aqui"),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 10,
                        child: Placeholder(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                  height: 24,
                                  child: Placeholder(
                                    child: Center(
                                        child: Text("Revise a descrição")),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: Placeholder(
                                    child: Center(
                                      child: Text(
                                        '''
Pequena
Descricao
Do
Pedido
''',
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Modular.to.pop(),
                                  child: const SizedBox(
                                    height: 18,
                                    // caso não concorde com essa descrição, toque aqui para escolher outro
                                    child: Placeholder(
                                      child: Center(child: Text("Change")),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Os serviços de calculo de frete se encontram em desenvolvimento.",
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      "Para podermos te passar os valores do frete, precisamos de tempo para oraçamentar com os TaxiDog que trabalham na região do canil, podendo oferecer variedade de preços e datas de entrega."),
                  Text(
                      textAlign: TextAlign.center,
                      "Dito isso, vamos te contatar para te passar o valor do frete a parte, o qual será pago em outro momento, e não está incluso no valor do pedido."),
                  Text(
                      textAlign: TextAlign.center,
                      "Não se preocupe, o valor do frete é bem acessível, e você pode optar por não contratar o serviço de frete, e vir buscar o seu filhote no canil, ou contratar um serviço de frete de sua preferência."),
                  Text(
                      textAlign: TextAlign.center,
                      "Caso ainda não concordar com o valor do frete, você pode cancelar o pedido, e o valor pago será devolvido integralmente."),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      "Todas as suas dúvidas serão sanadas no momento do contato."),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      "Obrigado pela compreensão!"),
                  Text(textAlign: TextAlign.center, "Atenciosamente,"),
                  Text(textAlign: TextAlign.center, "Equipe DreamPuppy"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
