// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';


//TODO: Adicionar ao json_serializable
enum PetGender {
  female(value: -1),
  male(value: 1);

  final int value;
  const PetGender({required this.value});
}

@JsonSerializable()
class Pet {
  String id;

  /// Imagens do cover podem ser em 512x512.
  String coverImgUrl;
  /// Preço cobrado em reais, não existe centavos nesse momento do app.
  int price;
  List<String> images;
  List<String> imagesHistory;
  String description;
  String genetics;
  DateTime? lastUpdate = DateTime.now();
  DateTime? birthDate = DateTime.now();
  VaccineRecord? vaccineRecord;
  PetGender gender; //TODO: substituir para gender
  //TODO: Exibir detalhes caracteristicos do filhote.
  List<String> characteristics = [];

  Pet({
    required this.id,
    required this.coverImgUrl,
    this.price = 0,
    this.images = const [],
    this.imagesHistory = const [],
    this.description = 'Descrição',
    this.genetics = "Genetica",
    //TODO: Avaliar a necessidade de required
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
