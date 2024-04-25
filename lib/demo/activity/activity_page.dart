import 'dart:async';
import 'package:demoflutter/presenter/other_manage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../bean/news_bean.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});
  static final String routerName = "/activity";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(child: NewsPage()),
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Items> items = [];
  int _page = 1;
  LoadStatus _loadStatus = LoadStatus.idle; // 初始加载状态

  Future<void> getNewsData({required bool refresh}) async {
    try {
      var bean = await OtherManage().getNews(_page);
      setState(() {
        if (refresh) {
          items = bean.data!.items!;
          _refreshController.refreshCompleted();

        } else {
          if( items.length <= bean.data!.total! ){
            items.addAll(bean.data!.items!);
          }else{
            _loadStatus = LoadStatus.noMore;
          }
          if(mounted) {
            setState(() {});
          }
          _refreshController.loadComplete();
        }
      });
    } catch (e) {
      setState(() {
        _loadStatus = LoadStatus.failed;
        items = [];
      });
    }
  }

  RefreshController _refreshController = RefreshController(initialRefresh: true);

  void _onRefresh() async{
    getNewsData(refresh: true);
  }

  void _onLoading() async{
    getNewsData(refresh: false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(
          complete: Text('刷新完成'), // 完成状态下的文字
        ),
        footer: CustomFooter(
          builder: (context,mode){
            Widget body ;
            if(_loadStatus==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(_loadStatus == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i){
            return NewsListItem(title: items[i].title??"");
          },
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    );
  }
}

// 列表项部件，封装为 StatelessWidget，避免不必要的布局重建
class NewsListItem extends StatelessWidget {
  final String title;

  const NewsListItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        height: 80,
        child: Text(title),
      ),
    );
  }
}







