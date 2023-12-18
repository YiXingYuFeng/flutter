import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/list_view.dart';
import 'package:flutter_application_1/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home',
      home: HomePage(),
      routes: {
        '/login': (context) => const LoginPage(context),
        '/list': (context) => const ListPage(),
      },
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
