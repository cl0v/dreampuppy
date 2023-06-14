import 'package:algolia/algolia.dart';
import '../../domain/gallery/entities/gallery.dart';
import '../../infra/datasources/gallery.dart';

class AlogliaGalleryDatasourceI implements IGalleryDatasource {
  final Algolia algolia;

  AlogliaGalleryDatasourceI(this.algolia);

  Future<List<GalleryEntity>> populateGallery() async {
    print("TODO: Implementar o populate da galeria");
    // final query = algolia.instance.index('pets');
    // final result = await query.getObjects();
    // final pets = result.hits.map((e) => Pet.fromJson(e.data)).toList();
    return [];
  }
}

class MockedGalleryDatasourceI implements IGalleryDatasource {
  @override
  Future<List<GalleryEntity>> populateGallery() async{
    return mockedList;
  }

  final mockedList = [
    GalleryEntity(
        id: "123",
        imgUrl: 'https://wallpapers.com/images/featured/wj7msvc5kj9v6cyy.jpg',
        petId: 'xyz'),
  ];
}
