import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class Global {
  /// 是否 ios
  static bool isIOS = Platform.isIOS;

  static Future getDeviceInfo() async {
    /// 读取设备信息
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    print('当前设备为$isIOS');
    if (isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo;
    }
  }
}
