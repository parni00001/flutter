import 'package:demoflutter/customwidgets/context_appbar.dart';
import 'package:demoflutter/presenter/user_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';

import '../main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routerName = "/login" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ContextAppbar.universalAppbar(context, "hahhah", false),
      body: const SingleChildScrollView(child: HomePageWedget()),
    );
  }
}

class HomePageWedget extends StatefulWidget {
  const HomePageWedget({super.key});

  @override
  State<HomePageWedget> createState() => _HomePageWedgetState();
}

class _HomePageWedgetState extends State<HomePageWedget> {
  final _usernameTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image.network("https://img0.baidu.com/it/u=3872518044,2803490591&fm=253&fmt=auto&app=138&f=JPEG?w=1021&h=295",
            fit: BoxFit.fill,
            height: 200,),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxHeight: 40),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.perm_identity,size: 20,),
                  Text("username :",),
                  Expanded(child: TextField(controller: _usernameTextEditingController,decoration: InputDecoration(contentPadding:EdgeInsets.only(bottom:15,left: 10),border:InputBorder.none),))
                ],),
            ),
          ),
          const Divider(height: 0),
          Container(
            constraints: const BoxConstraints(maxHeight: 40),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.lock_open_sharp,size: 20,),
                  Text("password :"),
                  Expanded(child: TextField(controller:_passwordTextEditingController,obscureText: true,
                    decoration: InputDecoration(contentPadding:EdgeInsets.only(bottom:15,left: 10),border:InputBorder.none),))
                ],),
            ),
          ),
          const Divider(height: 0),
          const SizedBox(height: 5,),
          const Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
              Text("forget account ?",style: TextStyle(decoration: TextDecoration.underline),),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(onPressed: (){
            UserManage().login(_usernameTextEditingController.text, _passwordTextEditingController.text).then((bean){
              SpUtil.putString("token",bean.data?.token??"");
              Navigator.pushNamedAndRemoveUntil(context, MainPage.routerName,ModalRoute.withName(MainPage.routerName));
            }).catchError((e){
              EasyLoading.showInfo(e.toString());
            });

          }, child: Text("Login",style: TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue) ,
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 40))))
        ],
      ),
    );
  }
}
