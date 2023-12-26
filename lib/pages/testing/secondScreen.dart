import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Second Screen')),
    body: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Second',style: TextStyle(fontSize: 24.0),),
      ],
    ),);
  }
}