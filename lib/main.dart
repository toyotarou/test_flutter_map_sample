import 'package:flutter/material.dart';
import 'package:test_flutter_map_sample/second_screen.dart';
import 'package:test_flutter_map_sample/third_screen.dart';

import 'home_screen.dart'; // LatLngの使用

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Map with Latest Version',
      home: ThirdScreen(),
    );
  }
}
