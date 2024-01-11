import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:autoaid/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends StatefulWidget {
  final Widget child;

  const BaseScaffold({
    super.key,
    required this.child,
  });

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  int _selectedIndex = 0;

  final _bottomNavigationItemList = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'order',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'first screen',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'User',
    ),
  ];
  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        context.go(AppPath.home);
        break;
      case 1:
        context.go(AppPath.orders);
        break;
      case 2:
        context.go(AppPath.firstScreen);
        break;
      case 3:
        context.go(AppPath.user);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.child,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromRGBO(246, 160, 45, 1.0),
          primaryColor: const Color.fromRGBO(
              246, 160, 45, 1.0), // Set primaryColor to transparent
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey),
              ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              backgroundColor: Colors.red, // Set backgroundColor to transparent
              iconSize: 30,
              items: _bottomNavigationItemList,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              currentIndex: _selectedIndex,
              onTap: (index) => _onItemTapped(index, context),
            ),
          ),
        ),
      ),
    );
  }
}
