import '../bloc/fetch_pet.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dreampuppy/src/_domain/entities/pet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreampuppy/src/features/slider/presentation/view/slider.dart';

//TODO: Buscar o produto do servidor, buscando assim todos os dados do pet em especifico
//TODO: Criar versão de carregamento da página (Shimmer/Skelton)
//TODO: Salvar o historico de fotos do filhote, para que sirva de memória

class PetDetailsPage extends StatefulWidget {
  final Pet? pet;
  final String? id;

  const PetDetailsPage({
    super.key,
    this.pet,
    this.id,
  });

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  final pageController = PageController();
  late final fetchBloc = Modular.get<FetchPetBloc>();

  @override
  initState() {
    super.initState();
    if (widget.pet == null && widget.id != null) {
      fetchBloc.add(FetchPetByIdEvent(widget.id!));
    } else {
      fetchBloc.add(SetPetEvent(widget.pet!));
    }
    /*
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red[200],
    ));
    */
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => fetchBloc,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: BlocBuilder<FetchPetBloc, Pet?>(
                    builder: (context, pet) {
                      if (pet == null) {
                        //TODO: Implementar um sisteminha de loading
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Stack(
                        children: [
                          PageView.builder(
                            itemCount: widget.pet!.images.length,
                            controller: pageController,
                            itemBuilder: (context, index) {
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: widget.pet!.images[index],
                                    fit: BoxFit.fitWidth,
                                    placeholder: (context, url) => Center(
                                      child: Container(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0, 0.95),
                                    child: Text(
                                      "(${index + 1}/${widget.pet!.images.length})",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: BackButton(
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.94, 0.94),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.black.withOpacity(.6),
                              child: IconButton(
                                onPressed: () {
                                  Modular.to.push(MaterialPageRoute(
                                      builder: (context) => PhotoViewPage(
                                            photos: widget.pet!.images,
                                            controller: pageController,
                                          )));
                                },
                                icon: const Icon(Icons.fullscreen),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
                                  widget.pet!.isMale
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
                                  style: ElevatedButton.styleFrom(),
                                  onPressed: () {},
                                  label: const Text("Comprar"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                          "O filhote mais alegre da ninhada."), //TODO: Replace with $description
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
                        /*
    
                            IconBornDate(
                              icon: Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                              text: "23 Abril",
                            ),
                            IconBornDate(
                              icon: Icon(
                                Icons.timer_sharp,
                                color: Colors.black,
                              ),
                              text: "21:32",
                            ),
                            */
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
                          onTap: () => Toast.show(
                            "Em breve",
                            duration: Toast.lengthShort,
                            gravity: Toast.bottom,
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
                          onTap: () => Toast.show(
                            "Em breve",
                            duration: Toast.lengthShort,
                            gravity: Toast.bottom,
                          ),
                          leading: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.photo),
                            ],
                          ),
                          title: const Text("Fotos antigas [ + Fotos]"),
                          //Videos e fotos > //TODO: Incentivar os canis a preferirem postar toda e qualquer foto relacionada aquele cachorro
                          //TODO: Exibir quantidade de fotos disponíveis.
                          //TODO: A partir 99 fotos, exibir "99+ fotos" (Corrigir o layout para numeros grandes)
                          trailing: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.black.withOpacity(.3),
                            child: const Text("99", style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(flex: 1, child: icon),
          Flexible(
            flex: 4,
            child: Row(
              children: [
                const VerticalDivider(),
                SizedBox(
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
      ),
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
