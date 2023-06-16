import '../entities/address.dart';

abstract class IAddressRepository {
  create(AddressEntity address);
}
