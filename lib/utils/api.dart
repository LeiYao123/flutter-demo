import 'package:dio/dio.dart';
import 'package:tablet/utils/config.dart';
import 'package:tablet/utils/storage.dart';

// 单例模式的 Dio
// https://www.bilibili.com/video/BV1tL411s7uv
class Http {
  static Http? _instance;
  static late Dio _dio;

  factory Http() => _instance ??= Http._init();

  // 私有的命名构造函数
  Http._init() {
    final BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      headers: {'Authorization': ''},
    );
    _dio = Dio(options);
    addInterceptors(_dio);
  }
  // 暴露方法获取 dio 实例
  static Dio getDio() => _dio;
}

// https://github.com/flutterchina/dio/blob/master/README-ZH.md#%E6%8B%A6%E6%88%AA%E5%99%A8
Dio addInterceptors(Dio dio) {
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    String token = LocalToken.getToken('token');
    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
    // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }, onError: (DioError e, handler) {
    return handler.next(e); //continue
  }));
  return dio;
}
