import 'package:autoaid/utils/palette.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/rating_widgets.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';

class ReviewGaragePage extends StatefulWidget {
  const ReviewGaragePage({super.key});

  @override
  State<ReviewGaragePage> createState() => _ReviewGaragePageState();
}

class _ReviewGaragePageState extends State<ReviewGaragePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: containerBoxShadow(
        250,
        10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Nguyen Van A'),
                SB_WIDTH(10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RatingWidget(3, 15, true),
                ),
              ],
            ),
            textGrey500('18/09/2002', 10),
          ],
        ),
      ),
    );
  }
}
