import 'package:dreampuppy/src/features/payment/domain/entities/cart_card_entity.dart';
import 'package:dreampuppy/src/modules/pet/domain/details/entities/pet.dart';
import 'package:dreampuppy/src/modules/pet/plugs.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Cria a conexão entre o módulo de pets e o módulo de pagamento.
class ConnectPetModuleExternalNavigation
    implements PetModuleExternalNavigation {
  String _buildResume(Pet pet) {
    return '''
      Preço: R\$4999
      Raça: Golden Retriever
      Gênero: Macho | Fêmea
      Cor: Golden
      Obs: Filhote com 2 meses de vida, vacinado e vermifugado.
      '''
        .trim();
  }

  @override
  //TODO: Um pushReplacemente facilitaria a troca do filhote, já que iria direto pra galeria.
  navigateToCart(Pet pet) => Modular.to.pushNamed(
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
