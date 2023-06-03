import 'package:json_annotation/json_annotation.dart';

import 'pet.dart';

part 'dog.g.dart';

@JsonSerializable()
class Dog extends Pet {
  //TODO: Padrões da raça pelo CBKC, link do PDF. (Esse tipo de informação deverá ser armazenada em outro lugar, que será a página principal de cada raça. Terá descrição da raça com mais detalhes.)
  String breed;

  Dog({
    required this.breed,
    required super.data,
    required super.value,
    required super.geoloc,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DogToJson(this);
}


@JsonSerializable()
class DogRequiredData extends PetComplementarData {
  DogRequiredData({required super.father, required super.mother});
  factory DogRequiredData.fromJson(Map<String, dynamic> json) => _$DogRequiredDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DogRequiredDataToJson(this);
}
