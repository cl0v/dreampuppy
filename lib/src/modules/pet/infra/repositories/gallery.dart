import '../datasources/gallery_datasource.dart';
import '../../domain/gallery/entities/gallery.dart';

abstract class IGalleryRepository {
  Future<List<GalleryEntity>> populateGallery();
}

class GalleryRepositoryI extends IGalleryRepository {
  final IGalleryDatasource dataSource;

  GalleryRepositoryI(this.dataSource);

  @override
  Future<List<GalleryEntity>> populateGallery() => dataSource.populateGallery();
}
