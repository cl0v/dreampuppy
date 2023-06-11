import 'package:dreampuppy/src/features/gallery/domain/entities/gallery_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GalleryEvent {}
abstract class GalleryState {}

class SetFiltersGalleryEvent extends GalleryEvent {
  final List<String> filters;

  SetFiltersGalleryEvent(this.filters);
}

class GalleryStateLoading extends GalleryState {}

class GalleryStateSuccess extends GalleryState {
  final List<GalleryEntity> entities;

  GalleryStateSuccess(this.entities);
}
class GalleryStateError extends GalleryState {
  final String message;
  final String? code;

  GalleryStateError(this.message, [this.code]);
}

class FetchGalleryBloc extends Bloc<GalleryEvent, GalleryState>{
  FetchGalleryBloc(): super(GalleryStateLoading()) {
    on<GalleryEvent>((event, emit) {
      emit(GalleryStateSuccess([]));
    });
  }

  onFetchGallery() {
   
  }
}