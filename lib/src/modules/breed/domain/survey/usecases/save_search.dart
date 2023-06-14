import '../../../infra/repositories/search.dart';

abstract class SaveSearchUseCase {
  call(String search);
}

class SaveSearchUseCaseImpl extends SaveSearchUseCase {
  final SearchRepository repository;

  SaveSearchUseCaseImpl(this.repository);

  @override
  call(String search) {
    // if (_breedAlreadyExists(search)) return;
    return repository.saveSearch(search);
  }


// >> Adicionar cachorros já cadastrados
// final List<String> knonwList = [
//   'Rottweiler',
// ];


  // bool _breedAlreadyExists(String search) {
  //   return knonwList.map((e) => e.toLowerCase()).contains(search.toLowerCase());
  // }
}
