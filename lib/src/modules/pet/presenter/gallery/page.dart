import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreampuppy/data.dart';
import 'package:dreampuppy/src/modules/pet/domain/gallery/entities/gallery.dart';
import 'package:dreampuppy/src/modules/pet/domain/gallery/entities/pet_card.dart';
import 'package:dreampuppy/src/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../config.dart';
import 'bloc/fetch_gallery.dart';

// TODO: O enquadramento das imagens será disposta em um modelo diferente, focando em 9/16; Para a imagem em grid
// TODO: Adicionar filtro que mostra a ninhada, o pai ou a mae na capa que deveria ter a ninhada.
// TODO: Adicionar barra lateral de filtro como mostra o exemplo do algolia no ecommerce
// TODO: Implementar botao de compartilhar
// > Botão de compartilar também envia as settings pre-configuradas do mesmo filtro
// TODO: Implementar botão de ir para o carrinho
// TODO: Adicionar ordenação e filtros
// TODO: A galeria mostrará os cachorros, sendo os filhotes ou os reprodutores.
// TODO: Para visualização da ninhada, como antes seria feito, o user deve acessar a informação de ninhadas do filhote ou reprodutor.
// > Em caso de reprodutor, exibir as ninhadas disponíveis, filtrar apenas por reprodutores que tem ninhadas disponíveis,
// >> Futuramente, permitir que a pessoa encomende o filhote.
// > Em caso de filhote, exibir a ninhada a qual pertence, onde terá todos os filhotes disponíveis.
//TODO: O que é o FilterChip?
//TODO: Acho que nem todos o s botões deveriam ser brancos, fica estranho
// TODO: Adicionar darkTheme

/// Essa página pode ser acessada por deep linking
/// Aplica filtros de busca e exibe uma galeria da imagem de capa de todos os pets encontrados.
/// A ideia é que essa galeria seja infinitamente scrollavel, exibindo até mesmo pets já vendidos, com uma marcação de "vendido" na imagem.
/// Ao clicar em uma imagem, o usuário seja redirecionado para a página de detalhes do pet.
class GalleryPage extends StatefulWidget {
  const GalleryPage({
    super.key,
    required this.breed,
  });
  //TODO: Receber informações sobre a raça em específico.
  final String breed;
  // gen (genero) -1/0/1 (femea/todos/macho) //TODO: Genero será a primeira versão
  // type (variação) "variação" (micro/toy/mini/exotic...) // TODO!: Por enquanto não tem variações (Terceira versão)
  // color (cor) "cor" (black/white/brown...) //TODO: Cor será a segunda versão
  //TODO: Adicionar specs de filtros ?gen=-1&type=frances&color=black

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  //TODO: BUG: GlobalKey está dando erro.
  late GlobalKey<ScaffoldState> _key;
  late final PetCardEntity petCard;

  final galleryBloc = Modular.get<FillGalleryBloc>();

  bool isLoading = false;

  @override
  void initState() {
    populateMockPetList();
    _key = GlobalKey();
    petCard = cards.firstWhere((element) => element.path == widget.breed);
    SystemConfig.changeStatusBarColor(petCard.color);
    super.initState();
  }

  populateMockPetList() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FillGalleryBloc, GalleryState>(
      bloc: null,
      builder: (context, state) {
        Widget? child;
        List<GalleryEntity> entities = [];
        switch (state.runtimeType) {
          case GalleryStateLoading:
            child = Center(
              child: isIos()
                  ? const CupertinoActivityIndicator(
                      color: Colors.black,
                    )
                  : const CircularProgressIndicator(),
            );
            break;
          case GalleryStateError:
            state = state as GalleryStateError;
            child = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      // fetchBloc.add(FetchPetByIdEvent(widget.id));
                    },
                    child: const Text("Tentar novamente"),
                  ),
                ],
              ),
            );
            break;
          case GalleryStateSuccess:
            state = state as GalleryStateSuccess;
            entities = state.entities;

            break;
          default:
        }

        return Scaffold(
          key: _key,
          //O Drawer deve ter o acesso facilitado ao máximo.
          // drawerEnableOpenDragGesture: kDebugMode,
          //TODO: Implementar o sistema de filtros do Drawer
          // endDrawer: kDebugMode
          //     ? Drawer(
          //         child: FilterView(
          //           barColor: petCard.color,
          //         ),
          //       )
          //     : null,
          appBar: AppBar(
            actions: const [
              SizedBox.shrink(),
            ],
            backgroundColor: petCard.color,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                //TODO: O comportamento esperado é que esse botão volte sempre pra lista de raças.
                //TODO: Interrogar usuários o que eles acham desse botão ter esse comportamento.
                if (Modular.to.canPop()) {
                  Modular.to.pop();
                } else {
                  Modular.to.pushReplacementNamed('/');
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: const Text(
              "Gallery",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: false,
            child: BottomAppBar(
                color: petCard.color,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // Modular.to.canPop()
                  //     ? TextButton.icon(
                  //         onPressed: Modular.to.pop,
                  //         icon: const Icon(
                  //           Icons.arrow_back_ios,
                  //           color: Colors.white,
                  //         ),
                  //         label: const Text(
                  //           "Anterior",
                  //           style: TextStyle(color: Colors.white),
                  //         ))
                  //     : const SizedBox.shrink(),
                  Row(
                    children: [
                      const Visibility(
                        visible: false,
                        child: IconButton(
                          //TODO: Adicionar botão de ir para o carrinho.
                          onPressed: null,
                          icon: Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                          tooltip: "Itens escolhidos",
                        ),
                      ),
                      Visibility(
                        visible: kDebugMode,
                        child: IconButton(
                          //TODO: Implementar compartilhar
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          tooltip: "Compartilhar",
                        ),
                      ),
                      //TODO: Adicionar botão de filtros
                      Visibility(
                        visible: true,
                        child: IconButton(
                          onPressed: () {
                            _key.currentState?.openEndDrawer();
                          },
                          icon: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(
                                  -1.0, 1.0, 1.0), // Apply horizontal mirroring
                            child: const RotatedBox(
                              quarterTurns: 0,
                              child: Icon(
                                Icons.sort,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          tooltip: "Adicionar filtros",
                        ),
                      ),
                    ],
                  )
                ])),
          ),
          // appBar: AppBar(
          //   title: const Text("Gallery"),
          //   actions: const [
          //     IconButton(
          //       onPressed: null,
          //       icon: Icon(Icons.shopping_bag),
          //       tooltip: "Itens escolhidos",
          //     ),
          //     IconButton(
          //       onPressed: null,
          //       icon: Icon(
          //         Icons.filter_alt_sharp,
          //         //TODO: Testar com os dois
          //         // Icons.filter_list_alt,
          //         // Icons.filter_list,
          //       ),
          //       tooltip: "Adicionar filtros",
          //     ),
          //     IconButton(
          //       onPressed: null,
          //       icon: Icon(
          //         Icons.share,
          //       ),
          //       tooltip: "Compartilhar",
          //     ),
          //   ],
          //   backgroundColor: petCard.color,
          // ),
          body: child ??= SafeArea(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.all(1),
              itemCount: entities.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: ((context, i) {
                final GalleryEntity entity = entities[i];
                return Container(
                  padding: const EdgeInsets.all(0.5),
                  child: InkWell(
                    onTap: () => Modular.to.pushNamed('/pet/p/${entity.petId}'),
                    child: Hero(
                      tag: entity.imgUrl,
                      child: CachedNetworkImage(
                        imageUrl: entity.imgUrl,
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey),
                        errorWidget: (context, url, error) => const Center(
                          //TODO: Substituir o erro quando não tem o url disponível ou houve um problema ao buscar a imagem.
                          child: Text("Filhote indisponível"),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
