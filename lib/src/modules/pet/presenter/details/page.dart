import 'package:dreampuppy/src/modules/pet/plugs.dart';
import 'package:dreampuppy/src/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bloc/fetch_pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dreampuppy/src/modules/pet/domain/details/entities/pet.dart';
import 'package:cached_network_image/cached_network_image.dart';

//TODO: Buscar o produto do servidor, buscando assim todos os dados do pet em especifico
//TODO: Criar versão de carregamento da página (Shimmer/Skelton)
//TODO: Salvar o historico de fotos do filhote, para que sirva de memória
//TODO: Tornar o fundo da imagem preto

/// Essa página pode ser acessada caso
class PetDetailsPage extends StatefulWidget {
  final String? id;

  const PetDetailsPage({
    super.key,
    this.id,
  });

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  final pageController = PageController();
  late final fetchBloc = Modular.get<FetchPetBloc>();

  Color? debugColor;

  @override
  initState() {
    super.initState();
    Future.microtask(() => fetchBloc.add(FetchPetByIdEvent(widget.id)));

    //TODO: Buscar o pet pelo ID.
    // Future.microtask(() => fetchBloc.add(InjectPetEvent(pets.first)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPetBloc, PetDetailsState>(
      bloc: fetchBloc,
      builder: (context, state) {
        Widget? child;
        PreferredSizeWidget? appBar;
        Pet? newPet;
        if (state is PetDetailsStateLoading) {
          child = Center(
            child: isIos()
                ? const CupertinoActivityIndicator(
                    color: Colors.black,
                  )
                : const CircularProgressIndicator(),
          );
        } else if (state is PetDetailsStateError) {
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
                    fetchBloc.add(FetchPetByIdEvent(widget.id));
                  },
                  child: const Text("Tentar novamente"),
                ),
              ],
            ),
          );
        } else if (state is PetDetailsStateSuccess) {
          newPet = state.pet;
          appBar = AppBar(
            title: const Text("Detalhes do pet"),
            centerTitle: true,
            backgroundColor: Colors.red.shade900,
          );
        }

        return Scaffold(
          appBar: appBar,
          body: child ??= SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: newPet!.images.length,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: newPet!.images[index],
                                fit: BoxFit.fitHeight,
                                placeholder: (context, url) => Hero(
                                  tag: newPet!.images[index],
                                  child: CachedNetworkImage(
                                    imageUrl: newPet.coverImgUrl,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0, 0.95),
                                child: Text(
                                  "(${index + 1}/${newPet.images.length})",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      Visibility(
                        visible: false,
                        child: Align(
                          alignment: const Alignment(0.94, 0.94),
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.black.withOpacity(.6),
                            child: IconButton(
                              onPressed: () {
                                // Modular.to.push(MaterialPageRoute(
                                //     builder: (context) => PhotoViewPage(
                                //           photos: newPet!.images,
                                //           controller: pageController,
                                //         )));
                              },
                              icon: const Icon(Icons.fullscreen),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'R\$',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '24999',
                                    textAlign: TextAlign.justify,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  newPet.gender == PetGender.male
                                      ? Icon(Icons.male,
                                          color: Colors.blue.shade300)
                                      : Icon(Icons.female,
                                          color: Colors.pink.shade300),
                                ],
                              ),
                            ),
                            const VerticalDivider(),
                            Row(
                              children: [
                                Visibility(
                                  visible: false,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(Icons.favorite_border),
                                  ),
                                ),
                                Visibility(
                                  visible: false,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.pets),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: onPetSelected,
                                  label: const Text("Comprar"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "O filhote mais alegre da ninhada. Pode ter certeza que você se divertirá muito com essa fofura. Está sempre andando para os lados procurando alguém pra brincar."), //TODO: Replace with $description
                            const SizedBox(
                              height: 10,
                            ),
                            // Divider(),
                            BirthRowWidget(
                              icon: Icon(
                                Icons.cake_rounded,
                                color: Colors.pink.shade100,
                              ),
                              child: const Text(
                                "23 Abril as 21:32",
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            BirthRowWidget(
                              icon: SizedBox(
                                  height: 24,
                                  child: Image.asset(
                                    "assets/images/icons/drug_medecine_syringue_icon.png",
                                    color: Colors.red.shade300,
                                  )),
                              child: const Text("2x Importada"),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            BirthRowWidget(
                              icon: SizedBox(
                                  height: 24,
                                  child: Image.asset(
                                    "assets/images/icons/dna_icon.png",
                                    color: Colors.blue.shade200,
                                  )),
                              child: const Text(
                                "Genética alemã",
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            BirthRowWidget(
                              icon: SizedBox(
                                  height: 24,
                                  child: Icon(
                                    Icons.camera_enhance_rounded,
                                    color: Colors.orange.shade200,
                                  )),
                              child: const Text(
                                "Fotos atualizadas hà 15 dias",
                              ),
                            ),
                            const Divider(),
                            Card(
                              child: ListTile(
                                tileColor: Colors.grey.shade300,
                                onTap: () => Fluttertoast.showToast(
                                  msg: "Em breve",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                ),
                                leading: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.info),
                                  ],
                                ),
                                title: const Text("Detalhes da ninhada"),
                                subtitle: const Text("Pai, Mãe, Irmãos"),
                                trailing: const Icon(Icons.lock_clock_rounded),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                tileColor: Colors.grey.shade300,
                                onTap: () => Fluttertoast.showToast(
                                  msg: "Em breve",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                ),
                                leading: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.photo),
                                  ],
                                ),
                                title: const Text(
                                  // "Fotos antigas [ + Fotos]",
                                  "Ver todas as fotos",
                                ),
                                // TODO: Incentivar os canis a preferirem postar toda e qualquer foto relacionada aquele cachorro
                                // Videos e fotos >
                                // TODO: Exibir quantidade de fotos disponíveis.
                                trailing: CircleAvatar(
                                    radius: 16,
                                    backgroundColor:
                                        Colors.black.withOpacity(.3),
                                    child: const Text(
                                      "101", //Dalmatas
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onPetSelected() async {
    //TODO: Add pet to CartProvider. CartProvider should be global and can be accessed anywhere, anytime, including from external fonts link.
    Modular.get<PetModuleExternalNavigation>();
    await Modular.to.pushNamed('/payment/cart');
  }
}

class BirthRowWidget extends StatelessWidget {
  const BirthRowWidget({
    super.key,
    required this.child,
    required this.icon,
  });

  final Widget child;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(flex: 1, child: icon),
        Flexible(
          flex: 4,
          child: Row(
            children: [
              const VerticalDivider(),
              const SizedBox(
                width: 12,
              ),
              child
            ],
          ),
        ),
        // VerticalDivider(),
        // IconBornDate(),
        // VerticalDivider(),
        // IconBornDate(),
      ],
    );
  }
}

class IconBornDate extends StatelessWidget {
  const IconBornDate({
    super.key,
    required this.icon,
    required this.text,
  });
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
