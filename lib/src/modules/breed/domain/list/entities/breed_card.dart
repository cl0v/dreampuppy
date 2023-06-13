import 'package:dreampuppy/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../pet/domain/gallery/entities/pet_card.dart';

class BreedCardWidget extends StatefulWidget {
  const BreedCardWidget({
    super.key,
    required this.card,
  });
  final PetCardEntity card;

  @override
  State<BreedCardWidget> createState() => _BreedCardWidgetState();
}

class _BreedCardWidgetState extends State<BreedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO: Enviar para a página de aplicação de filtros
      onTap: () {
        Modular.to.pushNamed('pets/${widget.card.path}/gallery').then((value) {
          return SystemConfig.changeStatusBarColor(
              Colors.black.withOpacity(.3));
        });
      },
      child: Stack(
        //TODO: Esses sitema não está bom, passar o stack apenas para trabalhar na sombra da imagem. Aqui da pra alinhar tranquilamente com column
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.card.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Align(
                alignment: const Alignment(0, -0.4),
                //TODO: Da pra colocar uma imagem preta atras dessa, com uma escala um pouco maior, cerca de 1.1 ou 1.2x e adicionar um blurry
                child: Image.asset(
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported_outlined),
                  widget.card.imgUrl,
                  //TODO: Testar tamanho em dispositivos variados.
                  height: 160,
                  fit: BoxFit.fitWidth,
                )),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    widget.card.breed,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
                const SizedBox(height: 4),
                Visibility(
                  visible: false,
                  child: SizedBox(
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {
                        Modular.to
                            .pushNamed('pet/${widget.card.path}/gallery')
                            .then((value) {
                          return SystemConfig.changeStatusBarColor(
                              Colors.black.withOpacity(.3));
                        });
                        //TODO: Esse botão leva pra tela de especificações da raça
                        //   Modular.to.pushNamed(
                        //   '/breeds/${widget.card.breed.toLowerCase()}',
                        //   arguments: widget.card,
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darken(widget.card.color, 0.45),
                        // Colors.grey,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 0,
                        //   horizontal: 32,
                        // ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.info,
                            size: 16,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Informações",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}
