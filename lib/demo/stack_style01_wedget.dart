import 'package:flutter/material.dart';

// Stack 样式demo
void main(){
  runApp(MaterialApp(home: Scaffold(
    appBar: AppBar(),
    body: const StackStyleWidget(),
  )));
}


class StackStyleWidget extends StatefulWidget {
  const StackStyleWidget({super.key});

  @override
  State<StackStyleWidget> createState() => _StackStyleWidgetState();
}

class _StackStyleWidgetState extends State<StackStyleWidget> {
  bool _isFavorite = false;

  void _updateFavoriteState(){
    setState(() {
      _isFavorite = !_isFavorite;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // 设置圆角半径为 10
        child: Stack(
          children: [
            Image.network("http://img1.baidu.com/it/u=1356385718,1030199449&fm=253&app=138&f=JPEG?w=800&h=1422", width: double.infinity,height: 200,fit: BoxFit.cover),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 40,
                color: const Color.fromARGB(100, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text("this is a title ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                    IconButton(onPressed: _updateFavoriteState, icon: _isFavorite ? Icon(Icons.favorite,size: 20, color: Colors.deepOrange):Icon(Icons.favorite_border,size: 20, color: Colors.deepOrange))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}