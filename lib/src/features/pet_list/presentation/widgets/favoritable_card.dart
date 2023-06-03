import 'package:dreampuppy/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/entities/pet_card.dart';

class FavoritablePetWidget extends StatefulWidget {
  const FavoritablePetWidget({
    super.key,
    required this.card,
  });
  final PetCardEntity card;

  @override
  State<FavoritablePetWidget> createState() => _FavoritablePetWidgetState();
}

class _FavoritablePetWidgetState extends State<FavoritablePetWidget> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO: Enviar para a página de aplicação de filtros
      onTap: () => Modular.to.pushNamed('pet/${widget.card.path}').then(
          (value) =>
              SystemConfig.changeStatusBarColor(Colors.black.withOpacity(.3))),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.card.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Align(
                alignment: const Alignment(0, -0.4),
                child: Image.asset(
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported_outlined),
                  widget.card.imgUrl,
                  //TODO: Testar tamanho em dispositivos variados.
                  height: 120,
                )),
          ),
         
          Align(
            alignment: const Alignment(0, 0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.card.breed,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () => Modular.to.pushNamed(
                      '/breeds/${widget.card.breed.toLowerCase()}',
                      arguments: widget.card,
                    ),
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
                          width: 2,
                        ),
                        Text(
                          "Saiba mais",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 4,
                // ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     height: 24,
                //     padding: const EdgeInsets.symmetric(
                //       vertical: 0,
                //       horizontal: 16,
                //     ),
                //     decoration: BoxDecoration(
                //       color: Colors.grey,
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     child: const Row(
                //       mainAxisSize: MainAxisSize.min,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.info,
                //           size: 16,
                //         ),
                //         Text("Saiba mais"),
                //       ],
                //     ),
                //   ),
                // ),
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
