import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/pages/picture.dart';

final Map<String, WidgetBuilder> staticRoutes = {
  "/login": (context) => LoginPage(), // 登录
  "/home": (context) => HomePage(),
  "/image": (context) => ImagePage()
};
