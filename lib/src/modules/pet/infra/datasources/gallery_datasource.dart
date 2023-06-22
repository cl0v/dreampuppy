import '../../domain/gallery/entities/gallery.dart';

abstract class IGalleryDatasource {
  /// Populate gallery with images from SearchQueryDatasource
  /// The filters should be passed as [GalleryFilters].
  Future<List<GalleryEntity>> populateGallery();
}
