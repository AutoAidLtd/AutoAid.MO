import 'package:autoaid/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
                  width: 100.0,
                  height: 100.0,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            const Column(
              children: [
                Text('Vicky Hladynets'),
                Text('District 1, Ho Chi Minh City'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: const Color.fromRGBO(170, 170, 170, 0.2),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Icon(Icons.search),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                squareButton('Emergency', () => context.push('/map')),
                squareButton('Motorbike Garage', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                squareButton('client Socket', () => context.push('/socket')),
                squareButton('Car Garage', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                squareButton('Go to Garage', () => context.push('/garageInfo')),
                squareButton('Car Garage', () {}),
              ],
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black),
              child: const SizedBox(
                height: 1000,
              ),
            ),
            const Text('out ot scope')
          ],
        )
      ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
