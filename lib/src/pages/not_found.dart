import 'package:flutter/material.dart';

class NotFound404Page extends StatefulWidget {
  const NotFound404Page({super.key});

  @override
  State<NotFound404Page> createState() => _NotFound404PageState();
}

class _NotFound404PageState extends State<NotFound404Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("404"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("404"),
      ),
    );
  }
}