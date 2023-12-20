// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  // const HomePage(context, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 页面标题
  Widget _homeTitle() {
    return Container(
      width: ScreenUtil().setWidth(540),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(60 + 44.0)),
      child: Text(
        'Welcome',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(32),
          height: 1,
        ),
      ),
    );
  }

  // 描述
  Widget _homeContent() {
    return Container(
      width: duSetWidth(242),
      height: duSetHeight(70),
      margin: EdgeInsets.only(top: duSetHeight(20)),
      child: Text(
        '北冥有鱼，其名为鲲。鲲之大，不知其几千里也，化而为鸟，其名为鹏。鹏之背，不知其几千里也；怒而飞，其翼若垂天之云',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: duSetFontSize(16),
          height: 1.3,
        ),
      ),
    );
  }

  // 主体列表
  Widget _homeContentList() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Container(
            width: duSetWidth(80),
            height: duSetHeight(80),
            child: Image.asset('static/images/1.jpg'),
          ),
          Spacer(),
          Container(
            width: duSetWidth(195),
            child: Text(
              '但如果我们只想简单的调整一个子元素在父元素中的位置的话调整一个子元素在父元素中的位置的话',
              style: TextStyle(
                color: AppColor.primaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 底部按钮
  Widget _homeFooter() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: ElevatedButton(
        child: Text(
          "欢迎光临",
          style: TextStyle(
            color: AppColor.primaryElementText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.normal,
            fontSize: duSetFontSize(16),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.primaryElement),
        ),
        onPressed: () {
          print('点击');
          Navigator.pushNamed(context, '/login');

          ///  如果没有登录则跳转至登录页
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              _homeTitle(),
              _homeContent(),
              _homeContentList(),
              _homeContentList(),
              _homeContentList(),
              _homeFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
