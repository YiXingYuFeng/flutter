import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 670));
    return const MaterialApp(
      title: 'Home',
      routes: staticRouter,
      home: HomePage(),
    );
  }
}

void main() {
  runZonedGuarded(() async {
    // await ScreenUtil.ensureScreenSize();
    runApp(const MyApp());
  }, (error, stackTrace) {
    // 异常处理函数
    print('Caught an error: $error');
    print('Stack trace: $stackTrace');
  });
}
