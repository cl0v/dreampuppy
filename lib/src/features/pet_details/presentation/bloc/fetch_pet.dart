import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../modules/pet/domain/details/entities/pet.dart';
import '../../domain/usecases/fetch_pet.dart';

abstract class PetEvent {}

class FetchPetByIdEvent extends PetEvent {
  final String? id;

  FetchPetByIdEvent(this.id);
}

class InjectPetEvent extends PetEvent {
  final Pet pet;

  InjectPetEvent(this.pet);
}

abstract class PetDetailsState {}

class PetDetailsStateLoading extends PetDetailsState {}

class PetDetailsStateSuccess extends PetDetailsState {
  final Pet pet;

  PetDetailsStateSuccess(this.pet);
}

class PetDetailsStateError extends PetDetailsState {
  final String message;
  final String? code;

  PetDetailsStateError(this.message, [this.code]);
}

class FetchPetBloc extends Bloc<PetEvent, PetDetailsState> {
  late final fetchPetByIdUseCase = Modular.get<FetchPetByIDUseCase>();

  FetchPetBloc() : super(PetDetailsStateLoading()) {
    debugPrint('FetchPetBloc inicializado');
    on<FetchPetByIdEvent>(fetch);
    on((InjectPetEvent event, emit) => emit(PetDetailsStateSuccess(event.pet)));
  }

  fetch(FetchPetByIdEvent event, Emitter<PetDetailsState> emitter) async {
    if (event.id == null) {
      return emitter(PetDetailsStateError(
        'Como você chegou aqui? 🤔 Verifique o link e tente novamente.',
      ));
    }
    return emitter.onEach<Pet>(
      fetchPetByIdUseCase(event.id!),
      onData: (pet) => emitter(PetDetailsStateSuccess(pet)),
      onError: (error, StackTrace? stackTrace) {
        if(stackTrace != null) Sentry.captureException(error, stackTrace: stackTrace);
        emitter(
          PetDetailsStateError(error.toString()),
        );
      },
    );
  }

}
