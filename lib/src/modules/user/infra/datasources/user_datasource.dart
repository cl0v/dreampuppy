import 'package:dreampuppy/src/modules/user/domain/profile/entities/user_sensitive_data.dart';

import '../../domain/address/entities/address.dart';

abstract class IUserDataSource {
  Future<void> create(UserSensitiveDataEntity data);
  Future<void> registerAddress(AddressEntity address);
}
