import 'package:dreampuppy/src/modules/pet/domain/gallery/entities/gallery.dart';
import 'package:dreampuppy/src/modules/pet/domain/gallery/usecases/populate_gallery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GalleryEvent {}

abstract class GalleryState {}

class FillGalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final PopulateGalleryUseCase useCase;

  FillGalleryBloc(this.useCase) : super(GalleryStateLoading()) {
    on<GalleryEvent>(onFetchGallery);
  }

  onFetchGallery(GalleryEvent event, Emitter<GalleryState> emit) async {
    print("//TODO: Implementar o fetch da galeria");

    await useCase.call().then((value) => emit(GalleryStateSuccess(value)));
  }
}

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
