import '../../infra/datasources/user_datasource.dart';
import '../../domain/address/entities/address.dart';
import '../../domain/address/repositories/address_repository.dart';

class AddressRepositoryI implements IAddressRepository {
  final IUserDataSource datasource;

  AddressRepositoryI(this.datasource);

  @override
  create(AddressEntity address) => datasource.registerAddress(address);
}
