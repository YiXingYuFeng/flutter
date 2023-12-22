import 'package:dio/dio.dart';

class RequestMethod {
  static RequestMethod getInstance() {
    if (_instance == null) {
      _instance = RequestMethod._internal();
    }
    return _instance!;
  }

  static RequestMethod? _instance = RequestMethod._internal();
  static late final Dio dio;

  RequestMethod._internal() {
    BaseOptions options = BaseOptions();
    dio = Dio(options);
    // request
    dio.interceptors.add(new RequestInterceptor());
  }
  get(String url, {option, params}) async {
    Response response;
    try {
      response =
          await dio.get(url, options: Options(responseType: ResponseType.json));
    } on Exception catch (e) {
      print('get方法报错$e');
    }
  }

  // https://blog.csdn.net/weixin_43244083/article/details/132016475
}

// 请求前拦截器
class RequestInterceptor extends Interceptor {
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(options);
    handler.next(options);
  }
}
