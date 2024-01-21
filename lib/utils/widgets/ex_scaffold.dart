import 'package:flutter/material.dart';

class ExScaffold extends StatelessWidget {
  final String title;
  final String bodyText;

  ExScaffold({super.key, required this.title, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Center(child: Center(child: Text(bodyText))),
      ),
    );
  }
}
