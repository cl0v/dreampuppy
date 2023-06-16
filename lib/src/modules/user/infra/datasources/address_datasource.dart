import 'package:dreampuppy/src/modules/user/domain/address/entities/address.dart';

abstract class IAddressDatasource {
  Future create(AddressEntity entity);
}
