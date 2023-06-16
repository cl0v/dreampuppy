import '../repositories/address_repository.dart';

abstract class CreateAddressUsecase {
  call();
}

class CreateAddressUsecaseI implements CreateAddressUsecase {
  final IAddressRepository repository;

  CreateAddressUsecaseI(this.repository);
  
  @override
  call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
