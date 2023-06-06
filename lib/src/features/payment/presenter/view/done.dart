import 'dart:async';

import 'package:dreampuppy/src/features/profile/domain/usecases/request_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentDonePage extends StatefulWidget {
  const PaymentDonePage({super.key});

  @override
  State<PaymentDonePage> createState() => _PaymentDonePageState();
}

class _PaymentDonePageState extends State<PaymentDonePage> {
  ValueNotifier<int> secondsRemainingNotifier = ValueNotifier(3);

  final RequestContactUseCase requestContactUseCase =
      Modular.get<RequestContactUseCase>();

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        secondsRemainingNotifier.value--;
        if (secondsRemainingNotifier.value <= 0) {
          timer.cancel();
          requestContactUseCase.call("Pedido concluido!");
        }
      },
    );
    // Future.delayed(Duration(seconds: 3), ()=>Modular.get<RequestContactUseCase>().call("Pedido concluido!"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Obrigado pela compra!",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 36,
            ),
            ValueListenableBuilder(
              valueListenable: secondsRemainingNotifier,
              builder: (_, secondsRemaining, child) {
                return Text(
                    "Você será redirecionado para o WhatsApp em $secondsRemaining segundos.");
              },
            ),
            const Text("Caso não seja redirecionado, clique no botão abaixo."),
            TextButton(
              onPressed: () => requestContactUseCase.call("Pedido concluido!"),
              child: const Text("+55 (33) 99852-5199"),
            ),
          ],
        ),
      ),
    );
  }
}
