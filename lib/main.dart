import 'package:demoflutter/demo/activity/activity_page.dart';
import 'package:demoflutter/demo/dark/dark_page.dart';
import 'package:demoflutter/demo/mine/mine_page.dart';
import 'package:flutter/material.dart';

import 'demo/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static final String routerName = "/main";
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          HomePage(),
          ActivityPage(),
          DarkPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: _items,
          type: BottomNavigationBarType.fixed),
    );
  }
}

class UiWedget extends StatelessWidget {
  const UiWedget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}

List<BottomNavigationBarItem> _items = [
  BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined,),
      activeIcon: Icon(Icons.home,color: Colors.blue),
      label: "home"),
  BottomNavigationBarItem(
      icon: Icon(Icons.local_activity_outlined),
      activeIcon: Icon(Icons.local_activity,color: Colors.blue),
      label: "activity"),
  BottomNavigationBarItem(
      icon: Icon(Icons.dark_mode_outlined),
      activeIcon: Icon(Icons.dark_mode,color: Colors.blue),
      label: "dark"),
  BottomNavigationBarItem(
      icon: Icon(Icons.people_alt_outlined),
      activeIcon: Icon(Icons.people_alt,color: Colors.blue),
      label: "mine"),
];