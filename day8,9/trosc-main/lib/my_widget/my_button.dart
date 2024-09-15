import 'package:flutter/material.dart';

Widget myButton(String text ,{required void Function()? onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      minimumSize: const Size(150, 50),
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    ),
  );
}
