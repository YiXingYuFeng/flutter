import 'package:flutter/material.dart';

import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/pages/list.dart';

final Map<String, WidgetBuilder> staticRoutes = {
  "/login": (context) => LoginPage(), // 登录
  "/sign-up": (context) => ListPage(), // 注册
};
