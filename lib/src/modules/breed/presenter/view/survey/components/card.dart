import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BreedsSurveyCardWidget extends StatefulWidget {
  const BreedsSurveyCardWidget({
    super.key,
  });

  @override
  State<BreedsSurveyCardWidget> createState() => _BreedsSurveyCardWidgetState();
}

class _BreedsSurveyCardWidgetState extends State<BreedsSurveyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/breed_priority_research'),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
                child: Image.asset(
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported_outlined),
              'assets/images/dogs/rottweiler.png',
              color: Colors.black.withOpacity(0.6), //TODO: Deixar mais cinza
              //TODO: Testar tamanho em dispositivos variados.
              height: 120,
            )),
          ),
          const Align(
            alignment: Alignment(0, 0.9),
            child: Text(
              'Outros',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
