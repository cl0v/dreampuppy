
import 'package:flutter/material.dart';

/// Para adicionar a contagem de quantidade de resultados encontrados, utilize o exemplo: [https://github.com/algolia/flutter-ecom-ui-template/blob/main/lib/ui/screens/filters/components/filters_footer_view.dart]

class FiltersFooterComponent extends StatelessWidget {
  const FiltersFooterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
              onPressed: () {  },
              child: const Text(
                "Limpar filtros",
                textAlign: TextAlign.center,
              )),
        ),
        const SizedBox(
          width: 10,
        ),
//TODO: Igualar o tamanho de ambos os botões, alterar o estilo e implementar
        ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Aplicar",
                  textAlign: TextAlign.center,
                )),
        // Expanded(
        //     child: StreamBuilder<SearchMetadata>(
        //   stream: metadata,
        //   builder: (context, snapshot) {
        //     final String nbHits;
        //     if (snapshot.hasData) {
        //       nbHits = ' ${snapshot.data!.nbHits} ';
        //     } else {
        //       nbHits = '';
        //     }
        //     return ElevatedButton(
        //         style: ElevatedButton.styleFrom(primary: AppTheme.darkBlue),
        //         onPressed: () => Navigator.pop(context),
        //         child: Text(
        //           "See $nbHits Products",
        //           textAlign: TextAlign.center,
        //         ));
        //   },
        // )),
      ],
    );
  }
}