import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? image;
  // 图片选择按钮
  Widget _buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    return ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(56),
          textStyle: TextStyle(fontSize: 20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Text(title)
          ],
        ));
  }

  // 图片上传事件
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source); // 从相册选择图片
      if (image == null) return;
      final imaegeTemporary = File(image.path);
      setState(() => this.image = imaegeTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 84,
          ),
          image != null
              ? Image.file(
                  image!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                )
              : FlutterLogo(
                  size: 160,
                ),
          _buildButton(
            title: 'picker Gallery',
            icon: Icons.image_outlined,
            onClicked: () => _pickImage(ImageSource.gallery),
          ),
          const SizedBox(
            height: 24,
          ),
          _buildButton(
            title: 'picker Gamera',
            icon: Icons.camera_alt_outlined,
            onClicked: () => _pickImage(ImageSource.camera),
          ),
        ]),
      ),
    );
  }
}
