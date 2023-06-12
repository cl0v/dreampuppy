import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import '../../src/_domain/entities/pet.dart';

class PetMockHelper {
  final Dio dio;

  PetMockHelper(this.dio);


  Future fetchBreedImages() async {
    try {
      final response = await dio.get('https://dog.ceo/api/breed/shihtzu/images');
      return response.data['message'];
    } catch (e) {
      print(e);
    }
  }

  Pet buildPet(List<String> imagesUrl) {
    var uuid = const Uuid();
    String randomId = uuid.v1();
    return Pet(id: randomId, coverImgUrl: imagesUrl.first, images: imagesUrl);
  }
}
