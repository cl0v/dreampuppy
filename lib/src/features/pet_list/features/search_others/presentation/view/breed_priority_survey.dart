import 'package:dreampuppy/src/features/pet_list/features/search_others/domain/usecases/save_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//TODO: Impedir a todo custo que o usuario tire o foco do campo de texto
//TODO: Oferecer diversas sugestões para facilitar a busca. (Criar uma lista que tenha todas as raças, sempre enviar o que foi digitado no campo)
//TODO: Ao tocar na sugestão, o campo *autopreenche* e já inicia a busca pela raça

class BreedPrioritySurveyPage extends StatefulWidget {
  const BreedPrioritySurveyPage({super.key});

  @override
  State<BreedPrioritySurveyPage> createState() =>
      _BreedPrioritySurveyPageState();
}

class _BreedPrioritySurveyPageState extends State<BreedPrioritySurveyPage> {
  final breedSearchController = TextEditingController();
  final breedSearchFocusNode = FocusNode();

  late SaveSearchUseCase saveSearchUseCase = Modular.get<SaveSearchUseCase>();
  
  search(String s) => saveSearchUseCase(s);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: TextField(
          decoration: const InputDecoration(hintText: 'Pesquisar raça'),
          controller: breedSearchController,
          onSubmitted: search,
          //TODO: Testar se está abrindo o teclado
          focusNode: breedSearchFocusNode..requestFocus(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              breedSearchController.text = "";
              breedSearchFocusNode.requestFocus();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () => search(breedSearchController.text),
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
