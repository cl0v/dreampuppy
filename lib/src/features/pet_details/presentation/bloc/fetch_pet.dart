import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../_domain/entities/pet.dart';
import '../../domain/usecases/fetch_pet.dart';

abstract class PetEvent {}

class FetchPetByIdEvent extends PetEvent {
  final String id;

  FetchPetByIdEvent(this.id);
}

class InjectPetEvent extends PetEvent {
  final Pet pet;

  InjectPetEvent(this.pet);
}

class FetchPetBloc extends Bloc<PetEvent, Pet?> {
  late final fetchPetByIdUseCase = Modular.get<FetchPetByIDUseCase>();

  FetchPetBloc() : super(null) {
    debugPrint('FetchPetBloc inicializado');
    on<FetchPetByIdEvent>(fetch);
    on((InjectPetEvent event, emit) => emit(event.pet));
  }

  fetch(FetchPetByIdEvent event, Emitter<Pet?> emitter) async {
    emitter.onEach<Pet>(
      fetchPetByIdUseCase(event.id),
      onData: (pet) => emitter(pet),
    );
  }
}
