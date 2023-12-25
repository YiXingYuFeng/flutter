import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  File? video;
  // final String videoUrl;
  // 选择按钮
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

  // 视屏
  Future _pickVideo(ImageSource source) async {
    try {
      final video =
          await ImagePicker().pickVideo(source: ImageSource.camera); //
      print('打印 视屏断点');
      print(video);
      if (video == null) return;
      final imaegeTemporary = File(video.path);
      print(imaegeTemporary);
      // setState(() => this.video = imaegeTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick video:$e');
    }
  }

  late VideoPlayerController _videoPlayerController;

  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Demo'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 84,
          ),
          _buildButton(
            title: 'picker Gallery',
            icon: Icons.image_outlined,
            onClicked: () => _pickVideo(ImageSource.gallery),
          ),
          const SizedBox(
            height: 24,
          ),
          _buildButton(
            title: 'picker Camera',
            icon: Icons.image_outlined,
            onClicked: () => _pickVideo(ImageSource.camera),
          ),
          // Container(
          //   child: _videoPlayerController.value.isInitialized
          //       ? AspectRatio(
          //           aspectRatio: _videoPlayerController.value.aspectRatio,
          //           child: VideoPlayer(_videoPlayerController),
          //         )
          //       : Text('null'),
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: Icon(
          _videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
      // body: Center(
      // 判断当前是否完成初始化，当isInitialized为true时表示视屏播放器已经准备好
      //   child: _videoPlayerController.value.isInitialized
      /**
        * AspectRatio 是一个Flutter小部件，用于调整其子部件的宽高比。
        * aspectRatio 是 AspectRatio 小部件的一个参数，用于指定子部件的宽高比。
        * 为了确保视频播放器的显示按照指定的宽高比进行渲染。而指定的宽高比来自于 _videoPlayerController.value.aspectRatio。
        */
      //       ? AspectRatio(
      //           aspectRatio: _videoPlayerController.value.aspectRatio,
      //           child: VideoPlayer(_videoPlayerController),
      //         )
      //       : Container(),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _videoPlayerController.value.isPlaying
      //           ? _videoPlayerController.pause()
      //           : _videoPlayerController.play();
      //     });
      //   },
      //   child: Icon(
      //     _videoPlayerController.value.isPlaying
      //         ? Icons.pause
      //         : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}
