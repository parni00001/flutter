import 'dart:io';

import '../bean/login_bean.dart';
import '../http/api.dart';
import '../customwidgets/exceptions.dart';

class UserManage{
  Future<LoginBean> login(String username,String password) async{
    if(username.isEmpty||password.isEmpty){
      throw ExceptionToString("不能为空");
    }
    return Api.login({"username":username,"password":password,"otp":"123456"}).then((value) {
      return LoginBean.fromJson(value);
    });
  }
  
  Future updateAvatar(File file,String desc) async{
    if(file==null){
      throw ExceptionToString("不能为空");
    }
    return Api.upload(file.path,desc).then((value) => print(" = = = 上传头像： ${value}"));
  }
}
