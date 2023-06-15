import 'package:flutter/material.dart';

class CreateAddressFormPage extends StatefulWidget {
  const CreateAddressFormPage({
    super.key,
    this.onSuccess,
  });
  
  final Function? onSuccess;

  @override
  State<CreateAddressFormPage> createState() => _CreateAddressFormPageState();
}

class _CreateAddressFormPageState extends State<CreateAddressFormPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}


