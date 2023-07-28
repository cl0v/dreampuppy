import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserMinimumRequirementsView extends StatefulWidget {
  const UserMinimumRequirementsView({super.key});

  @override
  State<UserMinimumRequirementsView> createState() =>
      _UserMinimumRequirementsViewState();
}

class _UserMinimumRequirementsViewState
    extends State<UserMinimumRequirementsView> {
  Widget? starterChild;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    Future.microtask(
      () => Modular.to.pushReplacementNamed('/user/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Show texxt "Verificando status de usuáprio".
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Verificando status de usuário'),
            const SizedBox(
              height: 8,
            ),
            Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
