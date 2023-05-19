import 'package:dreampuppy/src/domain/singletons/user.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class FavoriteUseCase{
  call(String petId, bool favorite);
}

class FavoriteUseCaseImpl extends FavoriteUseCase{
  @override
  call(String petId, bool favorite) {
    final user = Modular.get<UserSingleton>().user;
    if(user == null) return Exception(); //TODO: utilizar o multiresult para tratar isso
    //TODO: Nesse momento, o bloc deverá exibir a tela de dialog solicitando o login

    //TODO: executar o salvamento do like no servidor
    /// A partir daqui é feita a validação do like

  }
} 