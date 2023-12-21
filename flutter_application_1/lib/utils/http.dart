import 'package:dio/dio.dart';

// class DioManage {
//   static final DioManage _instance = DioManage._internal();
//   factory DioManage() => _instance();
//   static late final Dio dio;

//   DioManage._internal() {
//     BaseOptions options = new BaseOptions();
//     dio = Dio(options);

//     // request拦截器
//     dio.interceptors.add();

//     // error 拦截器
//     dio.interceptors.add();
//   }
//   /// baseUrl 地址
//   /// connectTimeout 链接超时时间
//   /// receiveTimeout 返回超时时间
//   /// Interceptor 基础拦截器
//   void init({
//       String? baseUrl,
//         int connectTimeout = 1500,
//         int receiveTimeout = 1500,
//         Map<String, String>? headers,
//         List<Interceptor>? interceptors,
//   }){
//     dio.options = dio.options.copyWith(
//        baseUrl: baseUrl,
//           connectTimeout: connectTimeout,
//           receiveTimeout: receiveTimeout,
//           headers: headers ?? const {},
//     )

//   }
// }

class RequestMethod{
  static RequestMethod getInstance() {
    if(_instance == null){
      _instance = RequestMethod._internal()
    }
    return _instance!;
  }
  static RequestMethod? _instance =  RequestMethod._internal();
  static late final Dio dio;

  RequestMethod._internal(){
    BaseOptions options = BaseOptions();
    dio = Dio(options);
    // request 
  }
  get(String url, {option, params}) async {
    Response response;
    try{
      response = await dio.get(url, options: Options(responseType: ResponseType.json));
    }
    on Exception catch(e){
      print('get方法报错$e');
    }
  }

  // https://blog.csdn.net/weixin_43244083/article/details/132016475

}