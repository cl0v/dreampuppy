

import 'package:algolia/algolia.dart';
import 'package:dreampuppy/src/_domain/entities/pet.dart';

class AlogliaPetDatasource{
  final Algolia algolia;

  AlogliaPetDatasource(this.algolia);

  @override
  Future<List<Pet>> getPets() async {
    final query = algolia.instance.index('pets');
    final result = await query.getObjects();
    final pets = result.hits.map((e) => Pet.fromJson(e.data)).toList();
    return pets;
  }
}