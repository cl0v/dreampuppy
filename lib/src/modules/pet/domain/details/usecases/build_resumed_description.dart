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
      'Preço: R\$ ${pet.price.toString()}\n',
      'Raça: ${pet.breed}\n',
      'Gênero: ${pet.gender.translate}\n',
      'Cor: ${pet.color ?? 'Padrão'}\n',
      'Observações: ${obs.isEmpty ? 'Nenhuma' : obs}',
    ].join();

  }
}
