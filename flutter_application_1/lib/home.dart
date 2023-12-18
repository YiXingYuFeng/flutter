// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(61, 255, 153, 0),
          title: const Text('Flutter App'),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(61, 255, 153, 0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('点击');
                },
                child: Text('点击跳转至登录页'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

