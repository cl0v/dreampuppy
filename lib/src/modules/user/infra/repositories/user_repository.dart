import 'package:dreampuppy/src/modules/user/infra/datasources/user_datasource.dart';

import '../../domain/profile/entities/user_sensitive_data.dart';

abstract class IUserRepository {
  Future<void> create(UserSensitiveDataEntity entity);
}

class UserRepositoryI implements IUserRepository {
  final IUserDataSource _dataSource;

  UserRepositoryI(this._dataSource);

  @override
  Future<void> create(UserSensitiveDataEntity entity) {
    return _dataSource.create(entity);
  }
}
