import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreampuppy/src/features/slider/presentation/view/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PetDetailsPage extends StatefulWidget {
  const PetDetailsPage({
    super.key,
    required this.images,
    required this.statusBarColor,
  });
  final List<String> images;

  final Color statusBarColor;
  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  final pageController = PageController();

  @override
  initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: widget.statusBarColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.48,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: widget.images.length,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: widget.images[index],
                              fit: BoxFit.fitWidth,
                            ),
                            Align(
                              alignment: const Alignment(0, 0.95),
                              child: Text(
                                "(${index + 1}/${widget.images.length})",
                                style: const TextStyle(color: Colors.white),
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
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.black.withOpacity(.6),
                        child: IconButton(
                          onPressed: () {
                            Modular.to.push(MaterialPageRoute(
                                builder: (context) => PhotoViewPage(
                                      photos: widget.images,
                                      controller: pageController,
                                    )));
                          },
                          icon: const Icon(Icons.fullscreen),
                          color: Colors.white,
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
                                  '2499',
                                  textAlign: TextAlign.justify,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.favorite_border),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share),
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Text(
                            "O filhote mais alegre da ninhada.")), //TODO: Replace with $description
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    BirthRowWidget(
                        icon: Icon(
                          Icons.cake_rounded,
                          color: Colors.pink.shade100,
                        ),
                        children: [
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
                        ]),
                    BirthRowWidget(
                        icon: Text(""),
                        children: [
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
                        ]),
                    Divider(),

                    Text(
                      'Saiba mais',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.start,
                    ),
                    Card(
                      child: ListTile(
                        tileColor: Colors.grey.shade300,
                        leading: const Icon(Icons.info),
                        title: const Text("Detalhes da ninhada"),
                        subtitle: const Text("Pai, Mãe, Irmãos"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BirthRowWidget extends StatelessWidget {
  const BirthRowWidget({
    super.key,
    required this.children,
    required this.icon,
  });

  final List<Widget> children;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon, const SizedBox(),
          const VerticalDivider(),
          ...children
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
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [icon, Text(text)],
    );
  }
}
