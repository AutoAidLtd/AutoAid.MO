import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter text',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      ),
    );
  }
}

Widget alignedRoundedTextField(String hintText) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      width: 200.0,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Phone number',
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        ),
      ),
    ),
  );
}

Widget alignedNumberTextField(String hintText) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      width: 200.0,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ], // Chỉ cho phép nhập số
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        ),
      ),
    ),
  );
}

Widget textB(String content, double sizee) => Text(
      content,
      style: TextStyle(
        fontSize: sizee,
        fontWeight: FontWeight.bold,
      ),
    );

Widget textN(String content, double sizee) => Text(
      content,
      style: TextStyle(
        fontSize: sizee,
        fontWeight: FontWeight.normal,
      ),
    );

Widget textGrey500(String content, double sizee) => Text(
      content,
      style: TextStyle(
        color: Colors.grey[500],
        fontSize: sizee,
      ),
    );

Widget textJustifyN(String content, double sizee) => Text(
      content,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: sizee,
        fontWeight: FontWeight.normal,
      ),
    );

Widget containerBoxShadow(double w, double br, Widget c) => Container(
      width: w,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(br),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          )
        ],
      ),
      child: c,
    );
