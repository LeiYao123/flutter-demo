import 'package:dio/dio.dart';
import 'package:tablet/utils/config.dart';
import 'package:tablet/utils/storage.dart';

// 单例模式的 Dio
// https://www.bilibili.com/video/BV1tL411s7uv
// https://juejin.cn/post/6992149128645984270
class Http {
  static Http? _instance;
  static late final Dio _dio;

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
  static Dio get dio {
    Http();
    return _dio;
  }
}

// dio 拦截器
// https://github.com/flutterchina/dio/blob/master/README-ZH.md#%E6%8B%A6%E6%88%AA%E5%99%A8
void addInterceptors(Dio dio) {
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      String token = LocalToken.getToken('token');
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    },
    onResponse: (response, handler) {
      bool success = response.data['success'];
      if (success) return handler.next(response);
      // 业务失败的情况下返回 DioError 类型对象 => handleReject 会走到 onError 里面
      handler.reject(
        DioError(
          error: Exception(response.data['message']),
          type: DioErrorType.response,
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    },
    onError: (DioError e, handler) {
      return handler.next(e);
    },
  ));
}
