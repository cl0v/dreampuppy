import 'package:flutter/material.dart';
import 'address/create_address_page.dart';
import 'credit_card/create_card.dart';
import 'profile/sensitive_data_form_page.dart';

class UserMinimumRequirementsView extends StatefulWidget {
  const UserMinimumRequirementsView({super.key});

  @override
  State<UserMinimumRequirementsView> createState() =>
      _UserMinimumRequirementsViewState();
}

class _UserMinimumRequirementsViewState
    extends State<UserMinimumRequirementsView> {
  //TODO: Busca pelo uuid conectado. Se não houver, redireciona para a tela de login
  // Na sequencia ele baixa o usuario do sistema
  // recebendo os dados necessários para a atividade de pagamento.

   final PageController pageController = PageController();

  // TODO :Exibir um loading enquanto busca qual a primeira página que deve ser exibida.
  // Caso não precise exibir nenhuma página, redirecionar para a tela de pagamento.
  


  onNext() {
    pageController.nextPage(
      duration: const Duration(microseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(controller: pageController, children: [
      // RegisterPage(),
      UserSensitiveDataFormPage(
        onSuccess: onNext,
      ),
      const CreateAddressFormPage(),
      const CreateCreditCardFormPage(),
    ]);
  }
}
