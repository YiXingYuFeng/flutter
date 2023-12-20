import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/screen.dart';
import 'package:flutter_application_1/values/colors.dart';

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
            child: Text(
              'GAIA',
              style: TextStyle(
                color: AppColor.primaryText,
              ),
            ),
          )
        ],
      ),
    );
  }

  // 登录表单

  // 第三方登录

  // 注册按钮

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
          ],
        ),
      ),
    );
  }
}
