import 'package:dreampuppy/iugu_api_keys.dart';
import 'package:dreampuppy/src/features/payment/external/services/iugu_payment_api.dart';
import 'package:dreampuppy/src/features/payment/infra/services/payment_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final IuguPaymentApiServiceImpl service = IuguPaymentApiServiceImpl();
  testWidgets('iugu payment api ...', (tester) async {
    expect(service.convertToBase64(""), "NUFBNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1Q0M1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NURENTo6");
  });
}
