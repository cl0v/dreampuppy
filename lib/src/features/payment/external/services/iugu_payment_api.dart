import 'dart:convert';

import 'package:dreampuppy/src/features/payment/infra/services/payment_api.dart';
import 'package:flutter/material.dart';

class IuguPaymentApiServiceImpl extends PaymentApiService {


  
  @visibleForTesting
  convertToBase64(String key, [String secret = ":"]) {
    return base64.encode(utf8.encode('$key:$secret'));
  }
  
  @override
  Future<String> createPayment(String token, String description, double amount) {
    // TODO: implement createPayment
    throw UnimplementedError();
  }
  
  @override
  Future<String> registerCard(String token, String customerId) {
    // TODO: implement registerCard
    throw UnimplementedError();
  }
  
  @override
  Future<String> registerCustomer(String token, String email) {
    // TODO: implement registerCustomer
    throw UnimplementedError();
  }
}