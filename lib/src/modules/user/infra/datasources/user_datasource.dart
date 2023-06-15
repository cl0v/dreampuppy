import 'package:dreampuppy/src/modules/user/domain/profile/entities/user_sensitive_data.dart';

abstract class IUserDataSource {
  Future<void> create(String uuid, UserSensitiveDataEntity data);
}