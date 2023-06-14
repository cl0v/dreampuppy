import 'package:dreampuppy/.archive/src/features/pet/gallery/presentation/components/filter/components/filter_header.dart';
import 'package:flutter/material.dart';

import 'components/filter_footer.dart';

//TODO: Implementar Drawer com filtros personalizados.
//TODO: Aumentar botão de aplicar filtro e melhorar o estilo do de limpar filtros, possivelmente deixando ele todo preto.

class FilterView extends StatefulWidget {
  const FilterView({super.key, required this.barColor});
  final Color barColor;
  //TODO: Receber filtros que já estão sendo usados.

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.bottom,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          const FiltersHeaderComponent(),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            //! TODO: Quando tocar para selecionar a ordem, permitir que a pessoa escolha qual a ordem que ela deseja
            // Entregar filtros avançados
            // Exemplo, ela seleciona filtrar por preço,
            // Mostrar a pessoa a opção de crescente ou decrescente,
            // Caso ela toque em filtros avançados, terá a opção de selecionar preço do filhote, preço do frete, preço TOTAL
            onTap: () => debugPrint(
                "Abrir menu em que posso escolher quais as opçoes de ordenação"),
            title: const Text("Ordem"),
            //TODO: Ordenar por
            /*
            Idade (1 -> 90 dias ou 90 -> 1)
            Proximidade (mostrar mais longe)
            Preço do filhote
            Preço TOTAL (incluso frete)

            */
            subtitle: const Text(">>> TIPO DE ORDENAÇÂO <<<"),
            trailing: const Icon(Icons.keyboard_arrow_down_outlined),
          ),
          Expanded(child: Container()),
          const Divider(),
          const FiltersFooterComponent(
              // metadata: searchRepository.searchMetadata,
              // onClear: searchRepository.clearFilters,
              ),
        ],
      ),
    );
  }
}
