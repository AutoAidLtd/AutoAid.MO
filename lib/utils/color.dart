import 'package:flutter/material.dart';

Color? gradientOrange(double fraction) {
  return Color.lerp(
    const Color(0xFFF26419),
    const Color(0xFFF6A02D),
    fraction,
  );
}

const kPrimaryColor = Color(0xFFF26419);
const kPrimaryLightColor = Color(0xFFF6A02D);
