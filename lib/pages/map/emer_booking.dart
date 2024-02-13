import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmergencyBookingScreen extends StatelessWidget {
  const EmergencyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(title: const Text('Booking Emergency Service'))),
      body: ListView(children: [
        Column(
          children: [
            Row(
              children: [
                SB_WIDTH(15),
                textB('Fill your information', 30),
              ],
            ),
            SB_HEIGHT(20),
            //
            Row(
              children: [
                SB_WIDTH(15),
                textB('Your Information', 20),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: containerBoxShadow(
                double.infinity,
                30,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textB('Services', 18),
                        textB('Email', 15),
                        textB('Phone number', 15),
                        textB('Address', 15),
                        textB('Detail', 15),
                      ],
                    ),
                    SB_WIDTH(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textN(' ', 18),
                        textN('Email', 15),
                        textN('Phone number', 15),
                        textN('Address', 15),
                        textN('Detail', 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SB_HEIGHT(30),
        buttonGradientOrange(
          'Send Emergency',
          () => handleConfirmBookingButton(context),
        ),
      ]),
    );
  }

  void handleConfirmBookingButton(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textB('Please confirm your Emergency Information', 20),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SB_HEIGHT(30),
                  textGrey500('Nguyen Gia Tin', 15),
                  SB_HEIGHT(30),
                  textGrey500('Vario Den Nham', 15),
                  SB_HEIGHT(30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push('/map');
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleConfirmBookingButton2(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: Column(
          children: [
            // SB_HEIGHT(30),
            textGrey500('Nguyen Gia Tin', 15),
            // SB_HEIGHT(30),
            textGrey500('Vario Den Nham', 15),
            // SB_HEIGHT(30),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
