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
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(51, 246, 246, 246),
                width: 2,
              ),
            ),
            child: TextField(
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
            ),
          ),
          // 登录按钮
          Container(
            width: duSetWidth(295),
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColor.secondaryElementText,
            ),
            child: ElevatedButton(
              onPressed: () {},
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
            ),
          )
        ],
      ),
    );
  }

  // 第三方登录

  // 注册按钮

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
