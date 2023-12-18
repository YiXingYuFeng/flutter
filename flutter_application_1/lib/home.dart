// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 页面标题
  Widget _homeTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text('data'),
    );
  }

  // 页面主体
  Widget _homeContent() {
    return Text('页面标题');
  }

  // 底部按钮
  Widget _homeFooter() {
    return Text('页面标题');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(61, 255, 153, 0),
            title: const Text('Flutter App'),
          ),
          body: Center(
              child: Column(
            children: [
              _homeTitle(),
              _homeContent(),
              _homeFooter(),
            ],
          ))),
    );
  }
}
