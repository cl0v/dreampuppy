import 'package:flutter/material.dart';

class FiltersHeaderComponent extends StatelessWidget {
  const FiltersHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Filtrar & Ordenar",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.help),
        ),
        IconButton(
            padding: const EdgeInsets.only(right: 0),
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close))
      ],
    );
  }
}
