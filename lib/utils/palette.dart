import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFFF26419); // Màu cam #F26419;
Color secondaryColor = const Color(0xFFF6A02D); // Màu cam #F6A02D;

// decoration: BoxDecoration(
//           gradient: gradientOrangeLR,
//           borderRadius: BorderRadius.circular(20.0),
//         ),
const gradientOrangeLR = LinearGradient(
  colors: [
    Color(0xFFF26419),
    Color(0xFFF6A02D),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
