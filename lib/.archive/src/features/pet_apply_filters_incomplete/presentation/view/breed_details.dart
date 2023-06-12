import 'package:dreampuppy/data.dart';
import 'package:dreampuppy/src/features/pet_list/domain/entities/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/entities/breed_details.dart';

// TODO: Adicionar uma forma criativa de levar o leitor para a página gallery
// TODO: Adicionar um divider vertical entre os botões e o seletor de filhote
// TODO: Manter todos os botões de selecões do mesmo tamanho, para dar um aspecto melhor, mesmo que isso coma um pouco do texto.
// TODO: É necessário que o pets sempre esteja alinhado conforme o esperado.
// Alinhamento (No final do container colorido, deve ficar abaixo 33% do filhote, o restante deve permanecer dentro do container)

class BreedDetailsPage extends StatefulWidget {
  const BreedDetailsPage({
    super.key,
    required this.breed,
  });

  final String breed;

  @override
  State<BreedDetailsPage> createState() => _BreedDetailsPageState();
}

class _BreedDetailsPageState extends State<BreedDetailsPage> {
  late final PetCardEntity card;
  late Size sScreen;

  //TODO: Vai buscar os valores do servidor, e irá atualizar quando os valores forem recebidos.
  late BreedDetails? details;

  @override
  void initState() {
    card = cards.firstWhere((element) => element.path == widget.breed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sScreen = MediaQuery.of(context).size;
    final shadow = Image.asset(
      card.imgUrl,
      width: sScreen.width * 0.4,
      height: sScreen.width * 0.4,
      color: Colors.black.withOpacity(.59),
    );

    final img = Image.asset(
      card.imgUrl,
      width: sScreen.width * 0.4,
      height: sScreen.width * 0.4,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Visibility(
            visible: false,
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.shopping_bag),
              tooltip: "Itens escolhidos",
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: sScreen.height * 0.40,
                  color: card.color,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          bottom: 8,
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            card.breed,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: true,
                        child: Align(
                          alignment: const Alignment(1, 1.5),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: -5,
                                child: shadow,
                              ),
                              img
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    //TODO: Diminuir o tamando da fonte de Med
                    "",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FilledButton(
                            onPressed: () => debugPrint("variação"),
                            style: FilledButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width / 2, 48),
                              backgroundColor: Colors.green.shade600,
                            ),
                            child: const Text("Selecione a variação"),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.black,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / 2, 48),
                              ),
                              child: const Text("Selecione a cor do pelo")),
                          const SizedBox(
                            height: 8,
                          ),
                          FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.black,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / 2, 48),
                              ),
                              onPressed: () {},
                              child: const Text("Selecione o gênero")),
                        ],
                      ),
                    ),
                    //TODO: Ajustar o tamanho desse botão para deixa-lo um pouco menos em destaque, por enquanto
                    Visibility(
                      visible: false,
                      child: GestureDetector(
                        //TODO: Corrigir a navegação pra galeria, lembrando que tenho que pensar na melhor forma de rotas, para não haver quebra de links desnecessários.
                        onTap: () =>
                            Modular.to.pushNamed('/gallery', arguments: card),
                        child: Container(
                          // margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          width: 90 * 1.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey[300],
                          ),
                          //TODO: Ou mostra a column, ou mostra a capa do filhote escolhido.
                          child: AspectRatio(
                            // aspectRatio: 10 / 16,
                            aspectRatio: 16 / 16,
                            child:

                                //TODO: Substituir o selecionar filhote pela imagem do filhote selecionado.
                                Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  //TODO: Experimental
                                  color: card.color,
                                  size: 64,
                                ),
                                const Text(
                                  "Selecionar filhote",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: null,
                    //   icon: Column(
                    //     children: [
                    //       Icon(Icons.image),
                    //       Text("Selecione o filhote"),
                    //     ],
                    //   ),
                    //   iconSize: 64,
                    // )
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 12),
                  child: Text(
                    "Sobre",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 12),
                  child: Text(
                    card.description ??
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                  ),
                  height: 300,
                  width: 300,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
