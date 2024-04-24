import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';

class Request {
  // 配置 Dio 实例
  static final BaseOptions _options = BaseOptions(
    baseUrl: 'https://bo.uomi.org/admin/',
    connectTimeout: const Duration(minutes: 60),
    receiveTimeout: const Duration(minutes: 60),
  );

  // 创建 Dio 实例
  static final Dio _dio = Dio(_options);

  // _request 是核心函数，所有的请求都会走这里
  static Future<T> _request<T>(String path, {String? method, Map? params,String? getParams}) async {
    // restful 请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    print("'_request发送的数据为：${params.toString()}");
    try {
      var url = _options.baseUrl+path;
      if(getParams!=null) url = url + getParams;

      String authorization = "Bearer ${SpUtil.getString("token")}";
      //from 请求方式
      Response response = await _dio.request(url,
          data: params, options: Options(method: method,
              headers: {"Authorization":authorization}));


      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          if (response.data['code'] != 0) {
            print("服务器错误，状态码为：${response.data['code']}");
            EasyLoading.showInfo('服务器错误，状态码为：${response.data['code']}');
            return Future.error(response.data['message']);
          } else {
            print("响应的数据为：${response.data}");
            if (response.data is Map) {
              return response.data;
            } else {
              return json.decode(response.data.toString());
            }
          }
        } catch (e) {
          print("解析响应数据异常：${e.toString()}");
          return Future.error('解析响应数据异常');
        }
      } else {
        print("HTTP错误，状态码为：${response.statusCode}");
        EasyLoading.showInfo('HTTP错误，状态码为：${response.statusCode}');
        _handleHttpError(response.statusCode??-1);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e, s) {
      print("请求异常：${_dioError(e)}");
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    } catch (e, s) {
      print("未知异常：${e}");
      return Future.error('未知异常');
    }
  }

  static Future<T> _requestToJson<T>(String path, {String? method, Map? params}) async {
    // restful 请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    print("'_requestToJson发送的数据为：${params.toString()}");
    try {
      var url = _options.baseUrl+path;
      print("'url：$url");
      // json 请求方式
      // 将请求体数据转换为 JSON 字符串
      String jsonData = jsonEncode(params);
      // 发送 POST 请求
      Response response = await _dio.post(
        url,
        data: jsonData,
        options: Options(
          headers: {'Content-Type': 'application/json'}, // 设置请求头
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          if (response.data['code'] != 0) {
            print("服务器错误，状态码为：${response.data['code']}");
            EasyLoading.showInfo('服务器错误，状态码为：${response.data['code']}');
            return Future.error(response.data['message']);
          } else {
            print("响应的数据为：${response.data}");
            if (response.data is Map) {
              return response.data;
            } else {
              return json.decode(response.data.toString());
            }
          }
        } catch (e) {
          print("解析响应数据异常：${e.toString()}");
          return Future.error('解析响应数据异常');
        }
      } else {
        print("HTTP错误，状态码为：${response.statusCode}");
        EasyLoading.showInfo('HTTP错误，状态码为：${response.statusCode}');
        _handleHttpError(response.statusCode??-1);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e, s) {
      print("请求异常：${_dioError(e)}");
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    } catch (e, s) {
      print("未知异常：${e}");
      return Future.error('未知异常');
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.badResponse:
        return "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
        break;
      default:
        return "Dio异常";
    }
  }

  // 处理 Http 错误码
  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    EasyLoading.showError(message);
  }

  static Future<T> get<T>(String path, {Map? params,String? getParams}) {
    return _request(path, method: 'get', getParams: getParams);
  }

  static Future<T> post<T>(String path, {Map? params}) {
    return _request(path, method: 'post', params: params);
  }

  static Future<T> postToJson<T>(String path, {Map? params}) {
    return _requestToJson(path, method: 'post', params: params);
  }

// 这里只写了 get 和 post，其他的别名大家自己手动加上去就行

  //上传文件
  static Future<T> uploadByFormData<T>(String path, String fliepath,String desc) async {
    try {
      var url = _options.baseUrl+path;
      String authorization = "Bearer ${SpUtil.getString("token")}";
      //fromdata 请求方式
      final formData = FormData.fromMap({
        'folder': desc,
        'file': await MultipartFile.fromFile(fliepath),
      });
      final response = await _dio.request(url,
          data: formData,
          options: Options(method: "post", headers: {
            "Authorization": authorization,
            'Content-Type': 'application/json'
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          if (response.data['code'] != 0) {
            print("服务器错误，状态码为：${response.data['code']}");
            EasyLoading.showInfo('服务器错误，状态码为：${response.data['code']}');
            return Future.error(response.data['message']);
          } else {
            print("响应的数据为：${response.data}");
            if (response.data is Map) {
              return response.data;
            } else {
              return json.decode(response.data.toString());
            }
          }
        } catch (e) {
          print("data: ${response.data}");
          print("解析响应数据异常：${e.toString()}");
          return Future.error('解析响应数据异常');
        }
      } else {
        print("HTTP错误，状态码为：${response.statusCode}");
        EasyLoading.showInfo('HTTP错误，状态码为：${response.statusCode}');
        _handleHttpError(response.statusCode??-1);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e, s) {
      print("请求异常：${_dioError(e)}");
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    } catch (e, s) {
      print("未知异常：${e}");
      return Future.error('未知异常');
    }
  }
}