import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dreampuppy/src/domain/singletons/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> checkUserLoginAndShowLoginDialog(BuildContext context,
    [String? title, String? content]) async {
  final sUser = Modular.get<UserSingleton>();
  if (sUser.user != null) return;

  await AwesomeDialog(
    headerAnimationLoop: false,
    context: context,
    //TODO: Melhorar o icone
    customHeader: const Icon(
      Icons.lock,
      size: 48,
      color: Colors.black,
    ),
    // animType: AnimType.rightS,lide,
    title: "Login necessário",
    desc: "A função que você está tentando acessar requer um usuário conectado",
    //TODO: Alterar o estilo dos botões, tentar fazer no mesmo modelo da página de login
    btnCancelText: 'Cadastrar',
    btnCancelOnPress: () => Modular.to.pushNamed('/login/register'),
    btnOkText: 'Entrar',
    btnOkOnPress: () {
      Navigator.of(context).pop(true);
    },
    // autoDismiss: false,
    // barrierColor: Colors.grey.shade200.withOpacity(0.2),
  ).show();
}

class _LoginRequiredDialog extends StatelessWidget {
  const _LoginRequiredDialog({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
            onPressed: () => Modular.to.pushNamed('/login/register'),
            child: const Text("Cadastrar")),
        ElevatedButton(
          onPressed: () => Modular.to.pushNamed('/login'),
          child: const Text("Entrar"),
        ),
      ],
    );
  }
}
