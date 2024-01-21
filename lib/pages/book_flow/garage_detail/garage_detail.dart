import 'package:autoaid/utils/palette.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/ex_scaffold.dart';
import 'package:flutter/material.dart';

class GarageInfoDetail extends StatefulWidget {
  const GarageInfoDetail({
    super.key,
  });

  @override
  State<GarageInfoDetail> createState() => _GarageInfoDetailState();
}

class _GarageInfoDetailState extends State<GarageInfoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoang Ha Garage'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: containerBoxShadow(
                250,
                30,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textB('Garage Information', 30),
                    textN('Email', 20),
                    textN('Phone number', 20),
                    textN('Address', 20),
                    textN('Detail', 20),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
              bottom: 25.0,
            ),
            child: containerBoxShadow(
                250,
                30,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textB('Services', 30),
                    textN('Email', 20),
                    textN('Phone number', 20),
                    textN('Address', 20),
                    textN('Detail', 20),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
