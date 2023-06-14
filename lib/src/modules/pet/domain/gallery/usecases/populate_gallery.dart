import 'package:dreampuppy/src/modules/pet/infra/repositories/gallery.dart';
import '../entities/gallery.dart';

abstract class PopulateGalleryUseCase {
  Future<List<GalleryEntity>> call();
}

class PopulateGalleryUseCaseImpl implements PopulateGalleryUseCase {
  final IGalleryRepository repository;

  PopulateGalleryUseCaseImpl(this.repository);

  @override
  Future<List<GalleryEntity>> call() => repository.populateGallery();
}
