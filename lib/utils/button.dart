import 'package:autoaid/utils/color.dart';
import 'package:autoaid/utils/palette.dart';
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

Align squareButton(String buttonLabel, Function callbackFunction) {
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          gradient: gradientOrangeLR,
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

Align buttonGradientOrange(String title, Function callbackFunction) => Align(
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: () => callbackFunction(),
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
              title,
              style: const TextStyle(
                color: Colors.white, // Màu chữ
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

// class ButtonGradientOrange extends StatefulWidget {
//   const ButtonGradientOrange({
//     super.key,
//     required this.title,
//     required this.callbackFunction,
//   });

//   final String title;
//   final Function callbackFunction;

//   @override
//   State<ButtonGradientOrange> createState() => _ButtonGradientOrangeState();
// }

// class _ButtonGradientOrangeState extends State<ButtonGradientOrange> {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: InkWell(
//         onTap: () {
//           widget.callbackFunction();
//         },
//         child: Container(
//           width: 200.0, // Điều chỉnh kích thước nút theo ý muốn
//           height: 50.0,
//           decoration: BoxDecoration(
//             gradient: gradientOrange(0),
//             borderRadius:
//                 BorderRadius.circular(25.0), // Điều chỉnh bo tròn theo ý muốn
//           ),
//           child: Center(
//             child: Text(
//               widget.title,
//               style: const TextStyle(
//                 color: Colors.white, // Màu chữ
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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

/// BUTTON ORANGE
class ButtonOrange extends StatefulWidget {
  const ButtonOrange({super.key, this.title, this.icon, this.onPressed});
  final String? title;
  final IconData? icon;
  final Function? onPressed;

  @override
  State<ButtonOrange> createState() => _ButtonOrangeState();
}

class _ButtonOrangeState extends State<ButtonOrange> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        alignment: Alignment.center,
        height: 50,
        child: TextButton(
          onPressed: widget.onPressed as void Function()?,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 60)),
          ),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (widget.icon == null)
                    ? const SizedBox.shrink()
                    : Icon(widget.icon ?? null, color: Colors.white),
                SizedBox(width: 5),
                Text(widget.title ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
        ));
  }
}
