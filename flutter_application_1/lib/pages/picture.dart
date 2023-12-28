import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_watermark/flutter_watermark.dart';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final DisableScreenshots _plugin = DisableScreenshots();
  File? image;
  File? comepressImage;
  late File _imageFile;
  File? uploadImg;

  // 创建dio
  Dio dio = new Dio();
  // 创建 cookieJar
  CookieJar cookieJar = CookieJar();

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

  // 选取图片
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source); // 从相册选择图片
      if (image == null) return;
      final imaegeTemporary = File(image.path);
      _imageFile = imaegeTemporary;
      print(imaegeTemporary);
      _compressImage();
      setState(() => this.image = imaegeTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  /**
   * 图片压缩 
   * 
   */
  Future _compressImage() async {
    print('图片压缩');
    /**
     *  _imageFile.readAsBytesSync() 从_imageFile对应的路径中同步读取所有字节的数据，返回一个 Uint8List类型字节的数组
     *  ! 符号表示非空断言操作符。当您确定某个表达式的结果一定不为 null 
     */
    img.Image image = img.decodeImage(await _imageFile.readAsBytesSync())!;
    print('未处理前图片大小');

    int imageWidth = image.width;
    int imageHeight = image.height;

    int setWidth = (imageWidth / 8).toInt();
    int setHeigth = (imageHeight / 8).toInt();
    print('图片原始宽${imageWidth}高${imageHeight}');
    print('图片压缩宽${setWidth}高${setHeigth}');
    // 等比例缩放大小 缩放值为8
    img.Image resizedImage =
        img.copyResize(image, width: setWidth, height: setHeigth);

    /**
     * 创建临时文件
     */
    String temPath = (await getTemporaryDirectory()).path;
    File ComepressedImageFile = File('$temPath/compare_image.jpg');
    comepressImage = ComepressedImageFile;
    List<int> comepressedFileSize =
        await ComepressedImageFile.readAsBytesSync()!;
    uploadImg = ComepressedImageFile;

    ComepressedImageFile.writeAsBytesSync(img.encodeJpg(resizedImage));
    print(resizedImage);

    if (_imageFile != null && ComepressedImageFile != null) {
      print('比较前后压缩变化情况');
      int _imageFileSize = image.length;
      int compressFileSize = comepressedFileSize.length;

      // 计算压缩后图片相对于原始图片的大小变化
      double reductionPercentage =
          ((_imageFileSize - compressFileSize) / _imageFileSize) * 100;
      print(reductionPercentage);
    }
  }

  // 图片上传
  Future _subImage() async {
    // 上传图片的服务地址
    String flieUploadUrl =
        'https://kmpmf.parramountain.com/product-api/brandPerformance/uploadPic';

    // 上传文件
    Map<String, dynamic> map = Map();
    map['file'] =
        await MultipartFile.fromFile(_imageFile.path, filename: 'facebook.png');

    // 构建formData
    FormData formData = FormData.fromMap(map);

    // 发送请求
    // 在dio前置拦截层中添加
    // 构建请求头
    Map<String, dynamic> headerMap = Map();
    headerMap['Cookie'] =
        'SESSION=MGY0ODZmOTAtMjliZi00YmNkLTliNWYtN2RkYmY5MGNhYTk3; userName=zhul; userId=f245858c814842b592b267a247c90e08; orgId=; orgType=null; nickName=%E7%A5%9D%E7%A3%8A; businessLevel=qt; userInfo=%7B%22email%22%3A%22%22%2C%22mobile%22%3A%22%22%2C%22position%22%3A%22%22%2C%22dept%22%3A%22%22%2C%22avatarUrl%22%3A%22%22%7D; customerType=km';
    dio.interceptors.add(CookieManager(cookieJar));
    Response response = await dio.post(
      flieUploadUrl,
      data: formData,
      options: Options(headers: headerMap),
    );

    print('打印上传返回');
    print(response);
  }

  // 图片添加水印 创建新的带有水印的图片
  // Future _addWaterImage() async {
  //   // 加载原始图片
  //   ByteData data = await rootBundle.load('assets/sample_image.jpg');
  //   Uint8List bytes = Uint8List.view(data.buffer);

  //   // 转换为Image对象
  //   img.Image? image = img.decodeImage(bytes);

  //   // 创建画布并绘制图片
  //   final recorder = ui.PictureRecorder();
  //   final canvas = Canvas(recorder);

  //   final imageCodec = await ui
  //       .instantiateImageCodec(Uint8List.fromList(img.encodePng(image)));
  //   final frame = await imageCodec.getNextFrame();
  //   final imageInfo = frame.image;
  //   final imagePaint = Paint();
  //   canvas.drawImage(imageInfo, Offset.zero, imagePaint);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 84,
            ),
            image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.contain,
                  )
                : FlutterLogo(
                    size: 160,
                  ),
            Container(
              padding: EdgeInsets.only(
                  top: duSetHeight(20), bottom: duSetHeight(20)),
              child: Text(
                'Image Picker',
                style: TextStyle(fontSize: 24),
              ),
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
              title: 'picker Camera',
              icon: Icons.camera_alt_outlined,
              onClicked: () => _pickImage(ImageSource.camera),
            ),
            const SizedBox(
              height: 24,
            ),
            comepressImage != null
                ? Image.file(
                    comepressImage!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.contain,
                  )
                : FlutterLogo(
                    size: 160,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _subImage(),
        child: Text(
          '上传',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
