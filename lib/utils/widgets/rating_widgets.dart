import 'package:autoaid/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//padding: const EdgeInsets.symmetric(vertical: 10),

Widget RatingWidget(double init, double size, bool notEdit) => Row(
      children: [
        RatingBar.builder(
          itemSize: size,
          initialRating: init,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ignoreGestures: notEdit,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: primaryColor,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
    );
