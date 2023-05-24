
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoreBreedsSurveyWidget extends StatefulWidget {
  const MoreBreedsSurveyWidget({
    super.key,
  });

  @override
  State<MoreBreedsSurveyWidget> createState() => _MoreBreedsSurveyWidgetState();
}

class _MoreBreedsSurveyWidgetState extends State<MoreBreedsSurveyWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed(
        '/breed_priority_research'
      ),
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
              color: Colors.black,
              //TODO: Testar tamanho em dispositivos variados.
              height: 120,
            )),
          ),
       
        const  Align(
            alignment: const Alignment(0, 0.9),
            child: Text(
              'Outros',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}