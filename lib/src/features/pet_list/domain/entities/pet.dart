import 'package:json_annotation/json_annotation.dart';
part 'pet.g.dart';

@JsonSerializable()
class Pet {
  /// Dog, Cat, Bunny, etc...
  String category;
  PetComplementarData data;
  double value;
  String? description;
  String ninhadaId;

  Pet({
    required this.category,
    required this.data,
    required this.value,
    required this.ninhadaId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);
}

@JsonSerializable()
class PetParentData {
  @JsonKey(includeToJson: false)
  final String id;
  final String coverUrl;
  final String name;
  final String nick;
  // Lista de imagens em carroulsel. //TODO: Adicionar uma descrição pra cada imagem.
  final List<String> imagesUrl;
  final String description;

  PetParentData({
    this.id = "",
    required this.coverUrl,
    required this.name,
    required this.nick,
    required this.imagesUrl,
    required this.description,
  });

  
  
  factory PetParentData.fromJson(Map<String, dynamic> json) => _$PetParentDataFromJson(json);
  Map<String, dynamic> toJson() => _$PetParentDataToJson(this);
}


@JsonSerializable()
class PetComplementarData {
  //TODO: Os dados de pai e mae deverão existir também na ninhada.
  final PetParentData father;
  final PetParentData mother;

  PetComplementarData({
    required this.father,
    required this.mother,
  });

  
  factory PetComplementarData.fromJson(Map<String, dynamic> json) => _$PetComplementarDataFromJson(json);
  Map<String, dynamic> toJson() => _$PetComplementarDataToJson(this);
}
