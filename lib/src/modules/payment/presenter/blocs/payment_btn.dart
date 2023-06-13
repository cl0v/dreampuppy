import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PamentBtnEvent {}

abstract class PaymentBtnState {}

class ActivatePaymentBtnEvent extends PamentBtnEvent {
  final bool? isActive;

  ActivatePaymentBtnEvent({
    this.isActive = true,
  });
}

class SetLoadingPaymentButtonEvent extends PamentBtnEvent {
  final bool? isLoading;

  SetLoadingPaymentButtonEvent({
    this.isLoading = false,
  });
}

class ChangePaymentBtnState extends PaymentBtnState {
  final bool isLoading;
  final bool isActive;

  ChangePaymentBtnState({
    this.isLoading = false,
    this.isActive = false,
  });
}

abstract class PayBtnBloc extends Bloc<PamentBtnEvent, PaymentBtnState> {
  bool isLoading = false;
  bool isActive = false;

  PayBtnBloc()
      : super(ChangePaymentBtnState(isActive: false, isLoading: false)){
        on<ActivatePaymentBtnEvent>((event, emit) {
          isActive = event.isActive!;
          emit(ChangePaymentBtnState(
            isActive: isActive,
            isLoading: isLoading,
          ));
        });
      }
}
