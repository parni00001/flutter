import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// 轮播图样式
class AdCarousel extends StatelessWidget {
  final List<String> ads = [
    'http://img1.baidu.com/it/u=1356385718,1030199449&fm=253&app=138&f=JPEG?w=800&h=1422',
    'http://img1.baidu.com/it/u=1728806402,3969000291&fm=253&app=138&f=JPEG?w=800&h=1422',
    'http://img2.baidu.com/it/u=125420472,2286281158&fm=253&app=138&f=JPEG?w=800&h=1422',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,  //可视区域占总宽度的比
      ),
      items: ads.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('广告轮播示例'),
      ),
      body: AdCarousel(),
    ),
  ));
}
