import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Greetings, planet!',
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.blue[700]!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'Greetings, planet!',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 1000,
              ),
              const Center(
                child: Text('Pages'),
              ),
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Greetings, planet!',
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.blue[700]!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'Greetings, planet!',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue, // Set the background color here
                  borderRadius: BorderRadius.circular(
                      10.0), // Optional: Add border radius for rounded corners
                ),
                width: 100,
                height: 100,
                // Other properties like padding, alignment, child, etc.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
