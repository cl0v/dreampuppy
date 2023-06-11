import '../entities/gallery_entity.dart';

abstract class FetchGalleryUseCase {
  Future<List<GalleryEntity>> call();
}

class FetchGalleryUseCaseImpl implements FetchGalleryUseCase {
  @override
  Future<List<GalleryEntity>> call() async {
    return [];
  }
}
