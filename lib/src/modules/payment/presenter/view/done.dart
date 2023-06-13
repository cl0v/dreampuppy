import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dreampuppy/src/features/payment/domain/usecases/comments.dart';
import 'package:dreampuppy/src/features/profile/domain/usecases/request_contact.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../features/payment/domain/usecases/rate.dart';
import '../../../../features/payment/domain/usecases/store_rating.dart';

class PaymentDonePage extends StatefulWidget {
  const PaymentDonePage({super.key});

  @override
  State<PaymentDonePage> createState() => _PaymentDonePageState();
}

class _PaymentDonePageState extends State<PaymentDonePage> {
  ValueNotifier<int> secondsRemainingNotifier = ValueNotifier(3);

  final TextEditingController commentController = TextEditingController();

  late final RequestContactUseCase requestContactUseCase =
      Modular.get<RequestContactUseCase>();

  late final StoreRatingUseCase reviewOnStore =
      Modular.get<StoreRatingUseCase>();

  late final SendCommentUseCase sendCommentUseCase =
      Modular.get<SendCommentUseCase>();

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        secondsRemainingNotifier.value--;
        if (secondsRemainingNotifier.value <= 0) {
          timer.cancel();
          AwesomeDialog(
            headerAnimationLoop: false,
            dialogType: DialogType.noHeader,
            context: context,
            body:  RateAppDialog(commentController: commentController,),
            btnOkOnPress: () {
              sendCommentUseCase.call(
                commentController.text, "from_wpp"
              );
              requestContactUseCase.call("Pedido concluido!");
            },
            btnOkText: "Abrir Whatsapp",
            showCloseIcon: true,
            btnCancelColor: Colors.blue,
            btnCancelText: "Avaliar na loja",
            btnCancelOnPress: () {
              sendCommentUseCase.call(
                commentController.text, "from_str"
              );
              reviewOnStore.call();
            },
          ).show();
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
              child: const Text("+55 (33) 99731-2898"),
            ),
          ],
        ),
      ),
    );
  }
}

// No icone de rating, adicionar uma carinha animada que vai se "assustando" a medida que avalia 5 estrelhas nas 3 opções 😱 só que no bom sentido
class RateAppDialog extends StatelessWidget {
  const RateAppDialog({
    super.key,
    required this.commentController,
  });

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    //TODO: Adicionar botão de avaliar na loja
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
              child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
                "* Sua avaliação é anônima e não tem vínculo com seu cadastro."),
          )),
          const SizedBox(
            height: 12,
          ),
          RatingElement(
            indentifyer: 'easy_to_use',
            question: "O aplicativo é facil de usar?",
          ),
          RatingElement(
            indentifyer: 'utility',
            question: "Te ajudou a encontrar o que queria?",
          ),
          RatingElement(
            indentifyer: 'recommend_to_friend',
            question: "Você recomendaria o aplicativo para um amigo?",
          ),

           TextField(
            maxLines: 5,
            controller: commentController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Comentário',
              alignLabelWithHint: true,
            ),
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: <Widget>[
          //     Placeholder(fallbackWidth: 200, fallbackHeight: 36, child: Center(child: Text("Avaliar na loja")),),
          //     Placeholder(fallbackWidth: 200, fallbackHeight: 36,child: Center(child: Text("Abrir Whatsapp")),),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class RatingElement extends StatelessWidget {
  RatingElement({Key? key, required this.question, required this.indentifyer})
      : super(key: key);

  final String question;
  final String indentifyer;

  late final sendRating = Modular.get<RateUseCase>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text(question)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              allowHalfRating: false,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                sendRating.call(indentifyer, rating.toInt());
              },
            ),
          ],
        ),
      ],
    );
  }
}
