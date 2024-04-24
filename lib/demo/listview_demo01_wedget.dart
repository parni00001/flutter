import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Scaffold(appBar: AppBar(),body: ListViewWedget(),),));
}

class ListViewWedget extends StatelessWidget {
  const ListViewWedget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _dataItem(),
    );
  }
}

List<Widget> _dataItem() {
  List<Widget> children = [];
  for(var i = 0;i<20;i++){
    children.add(const ItemWedget());
  }
  return children;
}


class ItemWedget extends StatefulWidget {
  const ItemWedget({super.key});

  @override
  State<ItemWedget> createState() => _ItemWedgetState();
}

class _ItemWedgetState extends State<ItemWedget> {
  bool _isMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: double.infinity,
      height: 40,
      color: Colors.black12,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex:9,child: Text.rich(
            maxLines: _isMore?2:1,
            overflow: TextOverflow.ellipsis,
            TextSpan(
                text: "hello world hello world hello world hello world hello world hello world hello world  ",
                children: <TextSpan>[
                  TextSpan(recognizer:TapGestureRecognizer()..onTap=(){
                    setState(() {
                      _isMore = false;
                    });
                  },text: "收回",style: const TextStyle(color: Colors.blue)),]),
          )),
          Expanded(flex:1,child: GestureDetector(
              onTap: (){
                setState(() {
                  _isMore = true;
                });
              },
              child: _isMore?null:const Text( "展开",style: TextStyle(color: Colors.blue))))
        ],
      ),
    );
  }
}
