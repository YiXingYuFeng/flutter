import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_application_1/utils/screen.dart';
import 'package:flutter_application_1/values/colors.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  File? viewImage;
  Uint8List? dealImage;
  // 按钮
  Widget _buildButton(String title) {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(34),
      margin: EdgeInsets.only(top: 20),
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
          title,
          style: TextStyle(
            color: AppColor.primaryElementText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w800,
            fontSize: duSetFontSize(16),
            wordSpacing: 13,
          ),
        ),
        onPressed: () => _loadImag(),
      ),
    );
  }

  Future _loadImag() async {
    try {
      final _imgFile =
          await ImagePicker().pickImage(source: ImageSource.gallery); // 从相册选择图片
      if (_imgFile != null) {
        viewImage = File(_imgFile.path);
        setState(() => this.viewImage = File(_imgFile.path));
        addWater(viewImage);
      }
    } catch (e) {
      print(e);
    }
  }

  // 添加水印
  Future addWater(viewImage) async {
    // 原始图片
    img.Image image = img.decodeImage(await viewImage.readAsBytesSync())!;

    img.Color nonNullableColor = img.ColorRgb8(0, 0, 0);
    // 添加水印
    img.drawString(
      image,
      'djaskdjalksjdlkasjdklasjdlkajdlkasjdlkasjdlkaj',
      font: img.arial24,
      x: 0, // 设置 x 坐标
      y: 0, // 设置 y 坐标
      color: nonNullableColor, // 设置文本颜色
      wrap: false, // 是否自动换行
    );

    // 转换为PNG
    final addWaterImage = img.encodePng(image);

    // 转换为Uint8List
    final result = Uint8List.fromList(addWaterImage);
    setState(() => this.dealImage = result);
    print('加水印结果');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('water Image')),
      body: Center(
        child: Column(
          children: [
            viewImage != null
                ? Image.file(
                    viewImage!,
                    width: 160,
                    fit: BoxFit.contain,
                  )
                : Image.asset('assets/images/GAIA_logo.png'),
            _buildButton('添加水印'),
            new SizedBox(
              height: 24,
            ),
            dealImage != null
                ? Image.memory(
                    dealImage!,
                    width: 160,
                    fit: BoxFit.contain,
                  )
                : Image.asset('assets/images/account_header.png')
          ],
        ),
      ),
    );
  }
}
