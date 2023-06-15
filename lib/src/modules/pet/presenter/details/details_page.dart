import 'package:dreampuppy/src/modules/pet/domain/details/usecases/format_birthdate.dart';
import 'package:dreampuppy/src/modules/pet/plugs.dart';
import 'package:dreampuppy/src/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../domain/details/usecases/format_last_update.dart';
import '../../domain/details/usecases/format_vaccination_record.dart';
import '../../domain/gallery/usecases/format_genetics.dart';
import 'bloc/fetch_pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dreampuppy/src/modules/pet/domain/details/entities/pet.dart';
import 'package:cached_network_image/cached_network_image.dart';

//TODO: Alterar a cor do snackBar para manter a categoria da raça? (Para isso vou precisar de bastante trabalho).
//TODO: Buscar o produto do servidor, buscando assim todos os dados do pet em especifico
//TODO: Criar versão de carregamento da página (Shimmer/Skelton)
//TODO: Salvar o historico de fotos do filhote, para que sirva de memória

/// Essa página pode ser acessada caso seja passado um ID de um pet pela url.
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
  late final formatBirthUsecase = Modular.get<FormatBirthDateUsecase>();
  late final formatVaccinationRecordUsecase =
      Modular.get<FormatVaccinationRecordUsecase>();
  late final formatLastUpdateUsecase = Modular.get<FormatLastUpdateUsecase>();
  late final formatGeneticsUsecase = Modular.get<FormatGeneticsUsecase>();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Pet"),
        centerTitle: true,
      ),
      body: BlocBuilder<FetchPetBloc, PetDetailsState>(
          bloc: fetchBloc,
          builder: (context, state) {
            late Pet pet;
            if (state is PetDetailsStateLoading) {
              return Center(
                child: isIos()
                    ? const CupertinoActivityIndicator(
                        color: Colors.black,
                      )
                    : const CircularProgressIndicator(),
              );
            } else if (state is PetDetailsStateError) {
              return Center(
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
              pet = state.pet;
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: pet.images.length,
                          controller: pageController,
                          itemBuilder: (context, index) {
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: pet.images[index],
                                  fit: BoxFit.fitHeight,
                                  placeholder: (context, url) => Hero(
                                    tag: pet.images[index],
                                    child: CachedNetworkImage(
                                      imageUrl: pet.coverImgUrl,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, 0.95),
                                  child: Text(
                                    "(${index + 1}/${pet.images.length})",
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pet.price.toString(),
                                      textAlign: TextAlign.justify,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Tooltip(
                                      preferBelow: false,
                                      message: pet.gender.translate,
                                      child: pet.gender == PetGender.male
                                          ? Icon(Icons.male,
                                              color: Colors.blue.shade300)
                                          : Icon(Icons.female,
                                              color: Colors.pink.shade300),
                                    ),
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
                                    onPressed: () => onPetSelected(pet),
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
                                height: 14,
                              ),
                              Text(pet
                                  .description), //TODO: Replace with $description
                              const SizedBox(
                                height: 24,
                              ),
                              // Divider(),
                              BirthRowWidget(
                                icon: Tooltip(
                                  preferBelow: false,
                                  message: 'Data de nascimento',
                                  child: Icon(
                                    Icons.cake_rounded,
                                    color: Colors.pink.shade100,
                                  ),
                                ),
                                child: Text(
                                  formatBirthUsecase(pet.birthDate),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              BirthRowWidget(
                                icon: Tooltip(
                                  preferBelow: false,
                                  message: 'Histórico de vacinação',
                                  child: SizedBox(
                                      height: 24,
                                      child: Image.asset(
                                        "assets/images/icons/drug_medecine_syringue_icon.png",
                                        color: Colors.red.shade300,
                                      )),
                                ),
                                child: Text(formatVaccinationRecordUsecase(
                                    pet.vaccineRecord)),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              BirthRowWidget(
                                icon: Tooltip(
                                  preferBelow: false,
                                  message: 'Genética | Linhagem',
                                  child: SizedBox(
                                      height: 24,
                                      child: Image.asset(
                                        "assets/images/icons/dna_icon.png",
                                        color: Colors.blue.shade200,
                                      )),
                                ),
                                child: Text(
                                  formatGeneticsUsecase(pet.genetics),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              BirthRowWidget(
                                icon: Tooltip(
                                  preferBelow: false,
                                  message: 'Última atualização do Pet',
                                  child: SizedBox(
                                      height: 24,
                                      child: Icon(
                                        Icons.camera_enhance_rounded,
                                        color: Colors.orange.shade200,
                                      )),
                                ),
                                child: Text(
                                  formatLastUpdateUsecase(pet.updtedAt),
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
                                  trailing:
                                      const Icon(Icons.lock_clock_rounded),
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
                                  trailing:
                                      const Icon(Icons.lock_clock_rounded),
                                  //  CircleAvatar(
                                  //   radius: 16,
                                  //   backgroundColor:
                                  //       Colors.black.withOpacity(.3),
                                  //   child:
                                  //    const Text(
                                  //     "101", //Dalmatas
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  // ),
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
            );
          }),
    );
  }

  void onPetSelected(Pet pet) async {
    //TODO: Add pet to CartProvider. CartProvider should be global and can be accessed anywhere, anytime, including from external fonts link.
    Modular.get<PetModuleExternalNavigation>().navigateToCart(pet);
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
