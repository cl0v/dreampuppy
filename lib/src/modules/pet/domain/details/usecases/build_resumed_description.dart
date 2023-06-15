import '../entities/pet.dart';

abstract class BuildResumedDescription {
  String call(Pet pet);
}

class BuildResumedDescriptionI implements BuildResumedDescription {
  @override
  String call(Pet pet) {
    String obs =
        'Filhote será entregue com ${pet.minLifeSpan} dias de vida, com as doses necessárias da vacina importada, vermifugado e comendo ração seca.';
   
   return <String>[
      'Preço: R\$ ${pet.price.toString()}',
      'Raça: ${pet.breed}',
      'Gênero: ${pet.gender.translate}',
      'Cor: ${pet.color ?? 'Padrão'}',
      'Observações: ${obs.isEmpty ? 'Nenhuma' : obs}',
    ].join("\n");

  }
}
