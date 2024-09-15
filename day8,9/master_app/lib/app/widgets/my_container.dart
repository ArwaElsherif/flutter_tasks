import 'package:flutter/material.dart';
// this is a methoud to create a container
Widget myContainer(Widget child) {
  return Container(
    height: 48,
    width: 98,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(48),
      border: Border.all(
        color: const Color(0xFF1F2022),
        width: 2,
      ),
    ),
    child: child ,
  );
}
