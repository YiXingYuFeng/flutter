import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.dart';
// import 'package:flutter_application_1/utils/http.dart';
import 'package:flutter_application_1/utils/screen.dart';
import 'package:flutter_application_1/values/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///  logo 带阴影
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(84)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: duSetWidth(76),
            height: duSetHeight(76),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    width: duSetWidth(76),
                    height: duSetHeight(76),
                    decoration: BoxDecoration(
                      color: AppColor.primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.1),
                          offset: Offset(4, 4),
                          blurRadius: 45,
                          spreadRadius: 0,
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/GAIA_logo.png',
                    fit: BoxFit.cover,
                    width: duSetWidth(60),
                    height: duSetHeight(60),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: duSetWidth(110),
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'GAIA',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w800,
                fontSize: duSetFontSize(16),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 用户名
  final TextEditingController _unameController = TextEditingController();
  // 密码
  final TextEditingController _passWordController = TextEditingController();

  final dio = Dio();
  // 登录操作
  _login(String userName, String password) async {
    try {
      /// 判断当前设备是否为 IOS
      var info = await Global.getDeviceInfo();
      print('当前设备标识${info.identifierForVendor}');
      final formData = FormData.fromMap({
        'username': userName,
        'password': password,
        'phoneCode': info.identifierForVendor
      });
      final response = await dio.post(
          'https://sjzc-bs-dev.parramountain.com/bs-auth-api/auth/login',
          data: formData);
      final responseData = response.data;
      final username = responseData['data']['username'];
      final userId = responseData['data']['userId'];
      print(username);
      print(userId);
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print('登录发生错误$e');
    }
  }

  // 执行登录操作
  _handleLogin() async {
    String userName = _unameController.text;
    String password = _passWordController.text;
    if (userName.isEmpty) {
      Fluttertoast.showToast(
          msg: "请输入用户账号",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    if (password.isEmpty) {
      Fluttertoast.showToast(
          msg: "请输入账号密码",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    _login(userName, password);
  }

  // 登录表单
  Widget _buildFrom() {
    return Container(
      width: duSetWidth(300),
      margin: EdgeInsets.only(top: duSetHeight(80)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.secondaryElement,
                width: 2,
              ),
            ),
            child: TextField(
              controller: _unameController,
              // 输入框 默认键盘输入类型
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入账号',
                contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              ),
              style: TextStyle(
                color: AppColor.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(18),
              ),
              maxLines: 1,
              autocorrect: false, // 自动纠正
              obscureText: false, // 是否隐藏输入内容
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.secondaryElement,
                width: 2,
              ),
            ),
            child: TextField(
              controller: _passWordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入账号密码',
                contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              ),
              style: TextStyle(
                color: AppColor.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(18),
              ),
              maxLines: 1,
              obscureText: true,
            ),
          ),
          // 登录按钮
          Container(
            width: duSetWidth(295),
            height: duSetHeight(34),
            margin: EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              color: AppColor.secondaryElementText,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.secondaryElementText),
              ),
              child: Text(
                '登录',
                style: TextStyle(
                  color: AppColor.primaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: duSetFontSize(16),
                ),
              ),
              onPressed: _handleLogin,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildFrom(),
          ],
        ),
      ),
    );
  }
}
