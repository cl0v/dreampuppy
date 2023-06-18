import '../entities/address.dart';

abstract class IAddressRepository {
  Future create(AddressEntity address);
}
