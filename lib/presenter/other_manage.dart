
import '../bean/news_bean.dart';
import '../http/api.dart';

class OtherManage{
  Future<NewsBean> getNews(int page) async{

    return Api.news("?page=$page&pageSize=10&_t=${DateTime.now().millisecondsSinceEpoch}").then((value) {
      return NewsBean.fromJson(value);
    });
  }
}