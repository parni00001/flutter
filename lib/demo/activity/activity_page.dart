import 'dart:async';
import 'package:demoflutter/presenter/other_manage.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import '../../bean/news_bean.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});
  static final String routerName = "/activity";

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late EasyRefreshController _controller;
  List<Items> items = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );

    getNewsData(refresh: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getNewsData({required bool refresh}) async {
    try {
      var bean = await OtherManage().getNews(_page);
      setState(() {
        if (refresh) {
          items = bean.data!.items!;
          _controller.finishRefresh();
          _controller.resetFooter();
        } else {
          items.addAll(bean.data!.items!);
          _controller.finishLoad(
              items.length >= bean.data!.total! ? IndicatorResult.noMore : IndicatorResult.success);

        }
      });
    } catch (e) {
      setState(() {
        items = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        controller: _controller,
        header: const CupertinoHeader(),
        footer: const CupertinoFooter(emptyWidget: Icon(Icons.add,color: Colors.white,)),
        onRefresh: (){
          _page = 1;
          getNewsData(refresh: true);
        },
        onLoad: (){
          _page++;
          getNewsData(refresh: false);
        },
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  child: Text("${items[index].title}"),
                ),
              );
            }));
  }
}






