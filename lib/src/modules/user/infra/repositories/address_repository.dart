import 'package:dreampuppy/src/modules/user/domain/address/entities/address.dart';

import '../../domain/address/repositories/address_repository.dart';
import '../datasources/address_datasource.dart';

class AddressRepositoryI implements IAddressRepository {
  final IAddressDatasource datasource;

  AddressRepositoryI(this.datasource);

  @override
  create(AddressEntity address) {
    // TODO: implement create
    throw UnimplementedError();
  }
}
