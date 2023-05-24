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

class SetPetEvent extends PetEvent {
  final Pet pet;

  SetPetEvent(this.pet);
}

class FetchPetBloc extends Bloc<PetEvent, Pet?> {

  late final fetchPetByIdUseCase = Modular.get<FetchPetByIDUseCase>();

  FetchPetBloc() : super(null) {
    debugPrint('FetchPetBloc inicializado');
    on<SetPetEvent>(set);
    on<FetchPetByIdEvent>(fetch);
  }

  fetch(FetchPetByIdEvent event, Emitter<Pet?> emitter) async{
    emitter.onEach<Pet>(
     fetchPetByIdUseCase(event.id),
     onData: (pet) => emitter(pet),
    );
    
  }

  set(SetPetEvent event, Emitter<Pet?> emitter) {
    emitter(event.pet);
  }
}
