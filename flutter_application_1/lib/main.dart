import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 设备适配初始化
    ScreenUtil.init(context, designSize: Size(375, 670));
    print(staticRoutes);
    // 项目主体
    return MaterialApp(
      title: 'Home',
      routes: staticRoutes,
      home: LoginPage(),
    );
  }
}

void main() {
  runZonedGuarded(() async {
    // await ScreenUtil.ensureScreenSize();
    runApp(MyApp());
  }, (error, stackTrace) {
    // 异常处理函数
    print('Caught an error: $error');
    print('Stack trace: $stackTrace');
  });
}
