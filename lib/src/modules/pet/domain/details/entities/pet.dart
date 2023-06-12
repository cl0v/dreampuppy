// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

/// Representa o sexo do pet.
enum PetGender {
  female(value: -1),
  male(value: 1);

  /// Valor que representa o sexo do pet no banco de dados e nos filtros de busca.
  final int value;

  const PetGender({required this.value});
}

/// Representa um filhote.
@JsonSerializable()
class Pet {
  String id;
  /// Imagens do cover podem ser em 512x512.
  String coverImgUrl;
  /// Preço cobrado em reais, não existe centavos nesse momento do app.
  int price;
  /// Imagens do pet que serão exibidas na página principal.
  List<String> images;
  /// Imagens do pet que serão exibidas apenas caso o user acesse o historico de fotos.
  List<String> imagesHistory;
  /// Breve descrição sobre a percepção do filhote.
  String description;
  /// Descreve a genética do filhote.
  String genetics; //TODO: Tornar uma subcollection dos documentos da collection breeds
  /// Data da ultima atualização do pet.
  DateTime? lastUpdate = DateTime.now();
  /// Data de nascimento do pet.
  DateTime? birthDate = DateTime.now();
  /// Carteira de vacinação do pet.
  VaccineRecord? vaccineRecord;
  /// Sexo do pet.
  PetGender gender;
  /// Caracteristicas do pet. Auxilia nos filtros de busca.
  List<String> characteristics = [];
  /// Caracteristicas especiais do pet. Auxilia nos filtros de busca e no aumento dos preços.
  /// Será usado também para dar mais detalhes no card de revisão do pedido.
  List<String> specialCharacteristics = [];

  Pet({
    required this.id,
    required this.coverImgUrl,
    required this.price,
    required this.images,
    this.imagesHistory = const [],
    this.description = 'Descrição',
    this.genetics = "Genetica",
    this.lastUpdate,
    this.birthDate,
    this.vaccineRecord,
    this.gender = PetGender.female,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}

@JsonSerializable()
class VaccineRecord {
  final List<Vaccine> vaccines;
  final List<Dewormer> dewormers;

  VaccineRecord({
    required this.vaccines,
    required this.dewormers,
  });

  factory VaccineRecord.fromJson(Map<String, dynamic> json) =>
      _$VaccineRecordFromJson(json);

  Map<String, dynamic> toJson() => _$VaccineRecordToJson(this);
}


@JsonSerializable()
class Vaccine {
  String brand;
  DateTime date;

  Vaccine({
    required this.brand,
    required this.date,
  });

  factory Vaccine.fromJson(Map<String, dynamic> json) =>
      _$VaccineFromJson(json);

  Map<String, dynamic> toJson() => _$VaccineToJson(this);
}


@JsonSerializable()
class Dewormer {
  final String brand;
  final DateTime date;

  Dewormer({
    required this.brand,
    required this.date,
  });

  factory Dewormer.fromJson(Map<String, dynamic> json) =>
      _$DewormerFromJson(json);

  Map<String, dynamic> toJson() => _$DewormerToJson(this);
}
