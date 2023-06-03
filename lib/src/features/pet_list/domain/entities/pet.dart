// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  /// Dog, Cat, Bunny, etc...
  final String category = 'dog';
  //TODO: Lançar sem os dados dos pais
  PetComplementarData data;
  //TODO: Lançar sem o id da ninhada
  // String ninhadaId;
  double value;
  String? description;
  @JsonKey(name: '_geoloc')
  Geoloc geoloc;

  Pet({
    required this.value,
    this.description,
    required this.data,
    // required this.ninhadaId,
    required this.geoloc,
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
class  Geoloc {
  final String lat;
  final String lng;

  Geoloc({
    required this.lat,
    required this.lng,
  });

  factory Geoloc.fromJson(Map<String, dynamic> json) => _$GeolocFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocToJson(this);
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
