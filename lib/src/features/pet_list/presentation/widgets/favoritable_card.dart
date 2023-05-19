import 'package:dreampuppy/src/domain/singletons/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../presentation/utils/login_required_dialog.dart';
import '../../domain/entities/pet_card.dart';

class FavotirablePetWidget extends StatefulWidget {
  const FavotirablePetWidget({
    super.key,
    required this.card,
  });
  final PetCardEntity card;

  @override
  State<FavotirablePetWidget> createState() => _FavotirablePetWidgetState();
}

class _FavotirablePetWidgetState extends State<FavotirablePetWidget> {
  late bool isFavorite;

  final user = Modular.get<UserSingleton>().user;
  @override
  void initState() {
    isFavorite = user?.isFavorite(widget.card.id) ?? false;
    super.initState();
  }

  onFavorite() async {
    await checkUserLoginAndShowLoginDialog(context);

    setState(() {
      isFavorite = !isFavorite;
    });

    //TODO: Implementar favoritar por usecase
    user?.favorites.add(widget.card.id);
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed(
        '/pets/dogs/${widget.card.breed.toLowerCase()}',
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.card.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
                child: Image.asset(
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported_outlined),
              widget.card.imgUrl,
              //TODO: Testar tamanho em dispositivos variados.
              height: 120,
            )),
          ),
          //TODO: Liberar o botão de favoritar para os usuarios
          Visibility(
            visible: false,
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: onFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red[600] : null,
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: Text(
              widget.card.breed,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
