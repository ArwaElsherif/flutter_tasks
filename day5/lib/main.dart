import 'package:flutter/material.dart';
import 'package:flutter_tasks/day5/day5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day5(),
    );
  }
}

