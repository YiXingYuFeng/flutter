import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(const MainApp());
  runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
          // 标题
          appBar: AppBar(
            title: Text("主页"),
          ),
          // 悬浮按钮
          floatingActionButton: Text("主页"),
          // 悬浮按钮动画
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          persistentFooterButtons: [
            Text('persistentFooterButtons1'),
            Text('persistentFooterButtons2'),
          ],
          // 压缩顶部菜单空间
          primary: false,
          // 底部菜单
          bottomNavigationBar: Text('bottomNavigationBar'),
          // 侧边栏
          drawer: Drawer(child: Text('侧边栏')),
          // 正文
          body: Center(
              child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.all(20),
              //   child: Image.asset('static/images/1.jpg'),
              // ),
              const Text(
                '如果使用地图内置的定位功能，根据业务需要，在info.plist文件中，配置相应的定位权限，详细可参考',
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24.0,
                  decoration: TextDecoration.underline,
                  // 文字间隙
                  letterSpacing: 3,
                  fontWeight: FontWeight.w800,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
              // 字符串拼接
              Text.rich(TextSpan(
                  text: '11',
                  style: TextStyle(color: Colors.orange),
                  children: [
                    TextSpan(
                      text: '000000000',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('aaaa');
                        },
                    )
                  ])),
              // Row
              Row(
                // textDirection: TextDirection.rtl,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('草长莺飞二月天'),
                  Text('一线一度思华年'),
                ],
              ),
              // cloumn
              Column(
                // verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('草长莺飞二月天'),
                  Text('一线一度思华年'),
                ],
              )
            ],
          )))));
}

// Scaffold 页面的脚手架
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'kill flutter',
      home: Scaffold(
        body: Center(
            child: Center(
          child: Text('hello, world',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  decoration: TextDecoration.underline)),
        )),
      ),
    );
  }
}
