import 'package:autoaid/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _fNavi(){
      context.go('/first');
    } 
    return Scaffold(appBar: AppBar(title: Text('Second Screen')),
    body:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Second',style: TextStyle(fontSize: 24.0),),
        buttonOrange('Navigate to second',_fNavi)
      ],
    ),);
  }
}