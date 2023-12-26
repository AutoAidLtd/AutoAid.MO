import 'package:autoaid/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _secondNavi(){
    context.go('/second');
    } 

    return Scaffold(appBar: AppBar(title: Text('First Screen'),),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('First',style: TextStyle(fontSize: 24.0),),
        buttonOrange('Navigate to second',_secondNavi)
      ],
    ),
    );
  }

  
}