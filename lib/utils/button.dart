import 'package:autoaid/utils/color.dart';
import 'package:flutter/material.dart';

Align buttonBlue(String buttonLabel, Function callbackFunction) {
  return Align(
    alignment: Alignment.topCenter,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
      ),
      onPressed: () => callbackFunction(),
      child: Text(buttonLabel, style: const TextStyle(fontSize: 20)),
    ),
  );
}

// #F26419
Align buttonOrange(String buttonLabel, Function callbackFunction) {
  return Align(
    alignment: Alignment.topCenter,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFf26419),
      ),
      onPressed: () => callbackFunction(),
      child: Text(buttonLabel, style: const TextStyle(fontSize: 20)),
    ),
  );
}

// Align buttonGradientOrange(String buttonLabel, Function callbackFunction) {
//   return Align(
//     alignment: Alignment.topCenter,
//     child: GradientButton(
//       onPressed: () {
//         () => callbackFunction;
//       },
//       text: 'My Gradient Button',
//       gradient: const LinearGradient(
//         colors: [Color(0xFFF26419), Color(0xFFF6A02D)],
//       ),
//     ),
//   );
// }

Align squareButton(String buttonLabel, Function callbackFunction) {
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF26419), // Màu #F26419
              Color(0xFFF6A02D), // Màu #F6A02D
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: () => callbackFunction(),
          child: Center(
            child: Text(
              buttonLabel,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

////////////////////////////////////////////////////////////////////
// class GradientButton extends StatelessWidget {
//   final Function onPressed;
//   final String text;
//   final LinearGradient gradient;

//   GradientButton({
//     required this.onPressed,
//     required this.text,
//     required this.gradient,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onPressed();
//       },
//       child: Container(
//         width: 200.0, // Điều chỉnh kích thước nút theo ý muốn
//         height: 50.0,
//         decoration: BoxDecoration(
//           gradient: gradient,
//           borderRadius:
//               BorderRadius.circular(25.0), // Điều chỉnh bo tròn theo ý muốn
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.white, // Màu chữ
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

Widget alignedGradientButton(String buttonLabel, Function callbackFunction) {
  return Align(
    alignment: Alignment.topCenter,
    child: InkWell(
      onTap: () {
        callbackFunction();
      },
      child: Container(
        width: 200.0, // Điều chỉnh kích thước nút theo ý muốn
        height: 50.0,
        decoration: BoxDecoration(
          gradient: gradientOrange(0),
          borderRadius:
              BorderRadius.circular(25.0), // Điều chỉnh bo tròn theo ý muốn
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: const TextStyle(
              color: Colors.white, // Màu chữ
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

// Hàm tạo màu gradient cam
LinearGradient gradientOrange(double fraction) {
  return LinearGradient(
    colors: const [
      Color(0xFFF26419), // Màu #F26419
      Color(0xFFF6A02D), // Màu #F6A02D
    ],
    stops: [
      fraction,
      fraction + 0.1
    ], // Điều chỉnh vị trí gradient dựa trên fraction
  );
}
