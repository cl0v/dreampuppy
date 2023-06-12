import 'package:dreampuppy/src/modules/pet/domain/gallery/entities/gallery.dart';
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

class FillGalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  FillGalleryBloc() : super(GalleryStateLoading()) {
    on<GalleryEvent>(onFetchGallery);
  }

  onFetchGallery(GalleryEvent event, Emitter<GalleryState> emit) {
    //TODO: Implementar o fetch da galeria
    emit(GalleryStateSuccess([]));
  }
}
