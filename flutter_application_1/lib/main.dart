import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home',
      home: HomePage(),
    );
  }
}

void main() {
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stackTrace) {
    // 异常处理函数
    print('Caught an error: $error');
    print('Stack trace: $stackTrace');
  });
}
