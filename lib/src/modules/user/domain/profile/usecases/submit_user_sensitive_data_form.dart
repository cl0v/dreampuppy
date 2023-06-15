import '../../../infra/repositories/user_repository.dart';
import '../../auth/repositories/authentication.dart';
import '../entities/user_sensitive_data.dart';

abstract class SubmitUserSensitiveDataFormUsecase {
  call(UserSensitiveDataEntity entity);
}

class SubmitUserSensitiveDataFormUsecaseI
    implements SubmitUserSensitiveDataFormUsecase {
  final AuthRepository _authRepository;
  final IUserRepository userRepository;

  SubmitUserSensitiveDataFormUsecaseI(
    this._authRepository,
    this.userRepository,
  );

  @override
  call(UserSensitiveDataEntity entity) async {
    final uuid = await _authRepository.currentUser();
    if (uuid == null) {
      throw Exception("Usuário não autenticado");
    }
    await userRepository.create(uuid, entity);
  }
}
