import 'dart:async';
import 'package:demoflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';

import 'demo/login.dart';
import 'package:demoflutter/config/router.dart' ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      routes:MyRouter.routes,
      initialRoute: MyRouter.initialRoute,
    );
  }
}

class SplashPage extends StatefulWidget {
  static final String routerName = "/";
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 2秒后跳转到主页
    Timer(Duration(seconds: 2), () {
      String token = SpUtil.getString("token")!;
      if (token.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(context, MainPage.routerName,ModalRoute.withName(MainPage.routerName));
      } else {
        Navigator.pushNamedAndRemoveUntil(context, LoginPage.routerName,ModalRoute.withName(LoginPage.routerName));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            Text(
              'Welcome to My App',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
