import 'package:flutter/material.dart';

class PaymentRequirementsPage extends StatefulWidget {
  const PaymentRequirementsPage({super.key});

  @override
  State<PaymentRequirementsPage> createState() =>
      _PaymentRequirementsPageState();
}

class _PaymentRequirementsPageState extends State<PaymentRequirementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //? b1 ElevatedButton
        //? b2 TextButton
        //? c1 Container
        //? c2 Column
        //? c3 Center
        //? c4 card
        //? l1 ListView
        //? l2 ListTile
        //? p1 Placeholder
        //? p2 Padding
        //? r1 Row
        //? s1 SizedBox
        //? t1 Text

        body: ListView(
      children: <Widget>[
        ListTile(
          title: Placeholder(
            fallbackHeight: 72,
          ),
        ),
        ListTile(
          title: Placeholder(
            fallbackHeight: 72,
          ),
        ),
        ListTile(
          title: Placeholder(
            fallbackHeight: 72,
          ),
        ),
        SizedBox(
          child: Placeholder(
            child: Text("Alguma nota"),
          ),
        ),
        ElevatedButton(
          child: Text("Continuar"),
          onPressed: ()=> null,
        ),
      ],
    ));
  }
}
