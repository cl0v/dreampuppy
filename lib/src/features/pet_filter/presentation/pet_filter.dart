// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GeneroCard extends StatelessWidget {
  final IconData iconData;
  final String descricao;

  GeneroCard({required this.iconData, required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              size: MediaQuery.of(context).size.height / 9, // Isso faz o ícone ocupar cerca de 1/3 do card
            ),
            SizedBox(height: 10),
            Text(
              descricao,
              maxLines: 3,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500), // Isso limita o texto a 3 linhas
              overflow: TextOverflow.ellipsis, // Isso adiciona '...' se o texto for muito longo
            ),
          ],
        ),
      ),
    );
  }
}

class TelaGenero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genero'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GeneroCard(
              iconData: Icons.pets,
              descricao: 'Descrição do gênero fêmea.',
            ),
          ),
          Expanded(
            child: GeneroCard(
              iconData: Icons.pets,
              descricao: 'Descrição do gênero macho.',
            ),
          ),
          Expanded(
            child: GeneroCard(
              iconData: Icons.pets,
              descricao: 'Descrição do gênero não especificado.',
            ),
          ),
        ],
      ),
    );
  }
}


/*
class PetFilterPage extends StatefulWidget {
  const PetFilterPage({
    Key? key,
    required this.breed,
  }) : super(key: key);

  final String breed;

  @override
  State<PetFilterPage> createState() => _PetFilterPageState();
}

class _PetFilterPageState extends State<PetFilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            child: CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1612837017391-4b6b2b0e2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGV0JTIwYnJlZWR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        child: IconButton(
            onPressed: null,
            icon:  Icon(Icons.arrow_forward),
          ),
      ) ,
    );
  }
}

class GenderIconCardButton extends StatelessWidget {
  const GenderIconCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(
        children: [
          Icon(Icons.female),
          Text("As fêmeas dessa especie")
        ],
      ),
    );
  }
}

class PaginationBottomAppNextAndBack extends StatelessWidget {
  const PaginationBottomAppNextAndBack({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  bool get isFirstPage => controller.page == 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isFirstPage
            ? Container()
            : Flexible(
                flex: 1,
                child: IconButton(
                  onPressed: () => controller.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
        Flexible(
          flex: 2,
          child: IconButton(
            onPressed: () => controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear),
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
      ],
    ));
  }
}


*/