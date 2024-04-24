import 'request.dart';

class Api {
  static Future login(data) {
    return Request.postToJson("login", params: data);
  }

  static Future news(String data) {
    return Request.get("news", getParams: data);
  }

  static Future upload(String filePath,String desc) {
    return Request.uploadByFormData("auth/upload", filePath,desc);
  }


}