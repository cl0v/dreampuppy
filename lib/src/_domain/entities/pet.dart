import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  String id;
  String coverImgUrl;
  List<String> images;
  bool isMale;
  // Details
  
  Pet({
    required this.id,
    required this.coverImgUrl,
    required this.images,
    this.isMale = true,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);
}
