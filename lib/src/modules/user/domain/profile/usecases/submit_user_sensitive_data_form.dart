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
    if (_authRepository.currentUserId == null) {
      throw Exception("Usuário não autenticado");
    }
    entity.email = _authRepository.currentUserEmail!;
    await userRepository.create(entity);
  }
}
