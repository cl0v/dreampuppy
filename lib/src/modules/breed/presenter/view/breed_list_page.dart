import 'package:dreampuppy/data.dart';
import 'package:dreampuppy/src/providers/user.dart';
import 'package:dreampuppy/src/modules/breed/presenter/view/survey/components/card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../domain/list/entities/breed_card.dart';
import '../../infra/datasources/search.dart';

//TODO: Usar o icone para organizar: Icons.filter_list_sharp (sort)

class BreedListPage extends StatefulWidget {
  const BreedListPage({super.key});

  @override
  State<BreedListPage> createState() => _BreedListPageState();
}

class _BreedListPageState extends State<BreedListPage> {
  late TextEditingController searchController;

  final userSingleton = Modular.get<UserProvider>();

  @override
  void initState() {
    searchController = TextEditingController();
    kDebugMode? Modular.get<SearchDataSource>().saveSearch('no') : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //TODO: Adicionar dialog de prevenção de saida do app. (Usar esse botão como atalho rapido para chamar o suporte)
        return true;
        // > (Quando o user tocar 2 vezes no "voltar" (Padrão do android), abrir o dialog e tocar novamente em sair, apenas fechar o app...)

        // await AwesomeDialog(
        //   headerAnimationLoop: false,
        //   context: context,
        //   dialogType: DialogType.warning,
        //   // animType: AnimType.rightSlide,
        //   title: 'Fechar Aplicativo',
        //   desc:
        //       'Toque Sair para fechar o Aplicativo\nNão se preocupe, sua sessão não será encerrada',
        //   // btnOkColor: Colors.red,
        //   // btnOkText: 'Sair',
        //   // btnCancelText: "Ajuda",
        //   // btnCancelColor: Colors.green,
        //   // btnCancelIcon: Icons.info,
        //   // btnCancelOnPress: () {
        //   //   Modular.to.pop(false);
        //   // },
        //   btnOkOnPress: () {
        //     Navigator.of(context).pop(true);
        //   },
        //   // autoDismiss: false,
        //   // barrierColor: Colors.grey.shade200.withOpacity(0.2),
        // ).show();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //TODO: Latir quando tocar no botão
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Fluttertoast.showToast(
              msg: "    Au au!    ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              textColor: Colors.white,
              fontSize: 16.0,
            ),
            icon: Image.asset(
              "assets/images/icons/logo512.png",
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dream",
                // style: GoogleFonts.rubik(
                //   fontWeight: FontWeight.w500,
                //   fontSize: 24,
                //   color: Colors.black,
                // ),
                style: TextStyle(
                  // fontFamily: 'Clicker Script',
                  // fontFamily: 'Rubik Gemstones',
                  fontFamily: 'Cherry Bomb One',
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF2B9199), //0xFF2B9199
                ),
              ),
              Text(
                "Puppy",
                // style: GoogleFonts.rubik(
                //   fontWeight: FontWeight.w500,
                //   fontSize: 24,
                //   color: Colors.black,
                // ),
                style: TextStyle(
                  // fontFamily: 'Clicker Script',
                  // fontFamily: 'Rubik Gemstones',
                  fontFamily: 'Cherry Bomb One',
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF2B9199),
                ),
              ),
            ],
          ),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(),
              icon: const Text(
                "Perfil",
                style: TextStyle(color: Colors.black),
              ),
              label: const Icon(
                Icons.account_circle,
                size: 26,
                color: Colors.black,
              ),
              onPressed: () => Modular.to.pushNamed('/user/'),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de pesquisa (Sem appBar)
            Visibility(
              visible: false,
              child: SearchBar(
                controller: searchController,
                hintText: 'Pesquisar por raça',
                hintStyle: MaterialStateProperty.resolveWith((states) {
                  var color = Colors.grey[500];
                  if (states.contains(MaterialState.focused)) {
                    color = Colors.grey[300];
                  }
                  return TextStyle(color: color);
                }),
                trailing: [
                  IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () => debugPrint(searchController.text),
                  )
                ],
              ),
            ),
            // const Divider(
            //   thickness: 1,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(
            //       "Explorar",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     //TODO: Adicionar um chip com o icone Icons.filter_list_sharp
            //     DropdownButton(
            //       items: const [
            //         //TODO: Adicionar um dropdown de filtro (Pensar em outra alternativa caso necessario)
            //         // DropdownMenuItem(child: Text("Ordem alfabetica (z-a)"))
            //         DropdownMenuItem(child: Text("Ordem alfabetica (a-z)")),
            //       ],
            //       onChanged: (obj) => debugPrint(
            //         obj.toString(),
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    semanticChildCount: cards.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 6,
                    ),
                    itemCount: cards.length + 1,
                    itemBuilder: (context, index) {
                      if (index == cards.length) {
                        return const BreedsSurveyCardWidget(
                          key: Key('breedsurveycard'),
                        );
                      }
                      cards.sort((a,b)=> a.breed.compareTo(b.breed));
                      final card = cards[index];
                      return BreedCardWidget(
                        key: const Key('breedcard'),
                        card: card,
                      );
                    }),
              ),
              // const Divider(),
              // const PageBottomWithInfos(),
            ),
          ],
        ),
      ),
    );
  }
}
