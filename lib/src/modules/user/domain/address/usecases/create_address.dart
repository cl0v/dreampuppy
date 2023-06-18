import 'package:dreampuppy/src/modules/user/domain/address/entities/address.dart';

import '../repositories/address_repository.dart';

abstract class CreateAddressUsecase {
  Future call(AddressEntity address);
}

class CreateAddressUsecaseI implements CreateAddressUsecase {
  final IAddressRepository repository;

  CreateAddressUsecaseI(this.repository);

  @override
  Future call(AddressEntity address) => repository.create(address);
}
