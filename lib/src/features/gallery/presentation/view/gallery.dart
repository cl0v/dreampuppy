import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreampuppy/src/features/gallery/presentation/view/filter/filter_view.dart';
import 'package:dreampuppy/src/features/pet_details/presentation/view/pet_details.dart';
import 'package:dreampuppy/src/features/pet_list/domain/entities/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/pet.dart';

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

final List<Pet> pets = [
  Pet(
    id: "id",
    coverImgUrl: 'https://m.media-amazon.com/images/I/71IeYNcBYdL._SX679_.jpg',
    images: const [
      'https://instagram.ftfl2-1.fna.fbcdn.net/v/t51.12442-15/346929063_558636119517469_6909837779127671266_n.jpg?stp=dst-jpg_e15_p480x480&_nc_ht=instagram.ftfl2-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=kc9wuef8oYsAX-5Dgg2&edm=ANmP7GQBAAAA&ccb=7-5&ig_cache_key=MzEwNDY5NDczNzMwNzQ1Mjc4NQ%3D%3D.2-ccb7-5&oh=00_AfAmpgzm-36oqVhxFROrhIRppiFPUeQwrKU_t2R-XV91kQ&oe=6466CEFE&_nc_sid=b32767',
      'https://instagram.ftfl2-1.fna.fbcdn.net/v/t51.12442-15/346929063_558636119517469_6909837779127671266_n.jpg?stp=dst-jpg_e15_p480x480&_nc_ht=instagram.ftfl2-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=kc9wuef8oYsAX-5Dgg2&edm=ANmP7GQBAAAA&ccb=7-5&ig_cache_key=MzEwNDY5NDczNzMwNzQ1Mjc4NQ%3D%3D.2-ccb7-5&oh=00_AfAmpgzm-36oqVhxFROrhIRppiFPUeQwrKU_t2R-XV91kQ&oe=6466CEFE&_nc_sid=b32767',
      'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
      'https://hairstyleonpoint.com/wp-content/uploads/2015/09/4ce06e936dcd5e5c5c3e44be9edbc8ff.jpg',
      'https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/11/full/1607656152-0479.jpg',
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
    ],
  ),
  Pet(
    id: "id",
    coverImgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
    images: const [
      'https://m.media-amazon.com/images/I/71IeYNcBYdL._SX679_.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
      'https://hairstyleonpoint.com/wp-content/uploads/2015/09/4ce06e936dcd5e5c5c3e44be9edbc8ff.jpg',
      'https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/11/full/1607656152-0479.jpg',
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
    ],
  ),
  Pet(
    id: "id",
    coverImgUrl:
        'https://hairstyleonpoint.com/wp-content/uploads/2015/09/4ce06e936dcd5e5c5c3e44be9edbc8ff.jpg',
    images: const [
      'https://m.media-amazon.com/images/I/71IeYNcBYdL._SX679_.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
      'https://hairstyleonpoint.com/wp-content/uploads/2015/09/4ce06e936dcd5e5c5c3e44be9edbc8ff.jpg',
      'https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/11/full/1607656152-0479.jpg',
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
    ],
  ),
  Pet(
    id: "id",
    coverImgUrl:
        'https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/11/full/1607656152-0479.jpg',
    images: const [
      'https://m.media-amazon.com/images/I/71IeYNcBYdL._SX679_.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
      'https://hairstyleonpoint.com/wp-content/uploads/2015/09/4ce06e936dcd5e5c5c3e44be9edbc8ff.jpg',
      'https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/11/full/1607656152-0479.jpg',
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
    ],
  ),
];

class GalleryPage extends StatefulWidget {
  const GalleryPage({
    super.key,
    required this.petCard,
  });
  //TODO: Receber informações sobre a raça em específico.
  final PetCardEntity petCard;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  //TODO: BUG: GlobalKey está dando erro.
  late GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    _key = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      //TODO: O drawer ainda não está funcionando.
      endDrawer: Drawer(
        child: FilterView(
          barColor: widget.petCard.color,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: widget.petCard.color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      //TODO: Usar a cor do botão se adaptar de acordo com o tema
                      onPressed: () => Modular.to.pop(),
                      // style: Theme.of(context).iconButtonTheme.style,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const Text(
                    "Gallery",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
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
                  //TODO: Adicionar botão de compartilhar
                  const Visibility(
                    visible: false,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      tooltip: "Compartilhar",
                    ),
                  ),
                  //TODO: Adicionar botão de filtros
                  Visibility(
                    visible: false,
                    child: IconButton(
                      onPressed: () {
                        _key.currentState?.openEndDrawer();
                      },
                      icon: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..scale(-1.0, 1.0, 1.0), // Apply horizontal mirroring
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
              ),
            ],
          )),
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
      body: SafeArea(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(1),
          itemCount: pets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: ((context, i) {
            final photo = pets[i].coverImgUrl;
            return Container(
              padding: const EdgeInsets.all(0.5),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PetDetailsPage(
                      images: pets[i].images,
                      statusBarColor: widget.petCard.color,
                    ),
                  ),
                ),
                child: Hero(
                  tag: photo,
                  child: CachedNetworkImage(
                    imageUrl: photo,
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
  }
}
