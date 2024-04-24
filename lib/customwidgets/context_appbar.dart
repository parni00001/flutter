import 'package:flutter/material.dart';

class ContextAppbar{

  static PreferredSizeWidget universalAppbar(BuildContext context,String title,bool isBack){
    return AppBar(backgroundColor: Colors.blue,
        title: Text(title,style: const TextStyle(color: Colors.white)),
        leading: isBack?IconButton(onPressed: (){
          // 返回上一个界面
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios_new),color: Colors.white):null);
  }

}