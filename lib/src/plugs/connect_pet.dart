import 'package:dreampuppy/src/modules/payment/domain/cart/entities/cart_pet_card_entity.dart';
import 'package:dreampuppy/src/modules/pet/domain/details/entities/pet.dart';
import 'package:dreampuppy/src/modules/pet/domain/details/usecases/build_resumed_description.dart';
import 'package:dreampuppy/src/modules/pet/plugs.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Cria a conexão entre o módulo de pets e o módulo de pagamento.
class ConnectPetModuleExternalNavigation
    implements PetModuleExternalNavigation {
  String _buildResume(Pet pet) {
    return Modular.get<BuildResumedDescription>()(pet).trim();
  }

  @override
  //TODO: Um pushReplacemente facilitaria a troca do filhote, já que iria direto pra galeria.
  navigateToCart(Pet pet) {
    return Modular.to.pushNamed(
        '/payment/cart',
        arguments: CartPetCardEntity.fromJson(
          pet.toJson()
            ..addAll(
              {
                'resume': _buildResume(pet),
              },
            ),
        ),
      );
  }
}
