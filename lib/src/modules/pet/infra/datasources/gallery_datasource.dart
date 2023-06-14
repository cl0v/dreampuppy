import '../../domain/gallery/entities/gallery.dart';

abstract class IGalleryDatasource {
  /// Populate gallery with images from SearchQueryDatasource
  Future<List<GalleryEntity>> populateGallery();
}
