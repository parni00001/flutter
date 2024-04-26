import 'dart:io';

import 'package:demoflutter/demo/mine/k_line_chart_page.dart';
import 'package:demoflutter/presenter/user_manage.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

import '../../config/globe.dart';
import '../../customwidgets/dialog/normal_dialog.dart';
import '../../customwidgets/pop_camera_or_album_widget.dart';
import '../login.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageShow(),
          ElevatedButton(
              onPressed: () {
                //底部弹窗
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return PopCameraOrAlbumWidget();
                  },
                );
              },
              child: Text("show bottom menu")),
          ElevatedButton(onPressed: (){
            // 显示对话框
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return NormalDialog();
              },
            );
          }, child: const Text("show dialog")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, KLineChartPage.routerName);
          }, child: Text("k线图 ")),
          ElevatedButton(
              onPressed: () {
                SpUtil.clear();
                Navigator.pushNamedAndRemoveUntil(context, LoginPage.routerName,ModalRoute.withName(LoginPage.routerName));
              },
              child: Text("exit")),
        ],
      ),
    );
  }
}


class ImageShow extends StatefulWidget {
  const ImageShow({super.key});

  @override
  State<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  String _data = "";
  @override
  void initState() {
    super.initState();
    // 订阅事件
    eventBus.on<AvatarChangeEvent>().listen((event) {
      setState(() {
        _data = event.path;
        UserManage().updateAvatar(File(event.path), "banner");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_data.isNotEmpty){
      File _image = File(_data);
      return Image.file(_image);
    }
    return Container();
  }
}

