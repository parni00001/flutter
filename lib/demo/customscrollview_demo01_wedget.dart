import 'package:flutter/material.dart';

//CustomScrollView demo
void main(){
  runApp(const MaterialApp(home: Scaffold(body: UiWedget(),)));
}

class UiWedget extends StatelessWidget {
  const UiWedget({super.key});

  List<String> _getGridData(){
    List<String> strs = [];
    for(int i = 0 ; i< 12;i++){
      strs.add("title : $i");
    }
    return strs ;
  }

  @override
  Widget build(BuildContext context) {
    List<String> strs = _getGridData();
    return CustomScrollView(
        slivers:<Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: Image.network("http://img1.baidu.com/it/u=1356385718,1030199449&fm=253&app=138&f=JPEG?w=800&h=1422",fit:BoxFit.fill),
          ),
          const SliverPadding(padding: EdgeInsets.all(5)),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return  GridItemWidget(strs,index);
              }, childCount: strs.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,mainAxisSpacing: 10,crossAxisSpacing: 10)),
          const SliverPadding(padding: EdgeInsets.all(5)),
          SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return  ListItemWidget(strs,index);
              },childCount: strs.length))
        ]);
  }
}

class GridItemWidget extends StatelessWidget {
  List<String> strs ;
  final index;

  GridItemWidget(this.strs,this.index);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 设置主轴尺寸为最小
        children: [
          const Icon(Icons.accessibility_new_outlined),
          Text(strs[index]),
        ],
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  List<String> strs ;
  final index;

  ListItemWidget(this.strs,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
          title: Text(strs[index]),
          subtitle: Text(strs[index]),
          leading:const Icon(Icons.access_alarm),
          trailing:const Icon(Icons.delete)
      ),
    );
  }
}

