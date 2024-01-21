import 'package:autoaid/pages/book_flow/garage_page/review_garage_page.dart';
import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/map/map_settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Logger().d('run only for the first time this widget is created');
  // }

  @override
  Widget build(BuildContext context) {
    // MapHelper.initializeHERESDK();
    void secondNavi() {
      context.push('/map');
    }

    return Center(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext ctxt, int index) {
          return Column(
            children: [
              SizedBox(height: 200),
              ReviewGaragePage(),
            ],
          );
        },
      ),
    );
  }
}
