import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/globe.dart';

// 定义事件类
class AvatarChangeEvent {
  final String _path;

  String get path => _path;

  AvatarChangeEvent(this._path);
}

class PopCameraOrAlbumWidget extends StatefulWidget {
  const PopCameraOrAlbumWidget({super.key});

  @override
  State<PopCameraOrAlbumWidget> createState() => _PopCameraOrAlbumWidgetState();
}

class _PopCameraOrAlbumWidgetState extends State<PopCameraOrAlbumWidget> {

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    await Permission.camera.status;
    await Permission.photos.status;
  }



  Future<void> _takePicture() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      eventBus.fire(AvatarChangeEvent(imageFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: Text('相册'),
            onTap: ()async{
              // 点击选项1时的操作
              final pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);
              eventBus.fire(AvatarChangeEvent(pickedFile?.path??""));
              // 处理选择的图片
              Navigator.pop(context); // 关闭底部弹窗
            },
          ),
          ListTile(
            title: Text('相机'),
            onTap: () {
              _takePicture();
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('取消'),
            onTap: () {
              // 点击取消时的操作
              Navigator.pop(context); // 关闭底部弹窗
            },
          ),
        ],
      ),
    );
  }
}

