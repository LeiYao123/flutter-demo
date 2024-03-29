import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/utils/config.dart';
import 'package:tablet/utils/global.dart';
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
      // https://stackoverflow.com/questions/73106834/flutter-dio-interceptor-error-bad-state-future-already-completed
      // connectTimeout: 20000,
      receiveTimeout: const Duration(seconds: 20),
    );
    _dio = Dio(options);
    _addInterceptors(_dio);
  }
  // 暴露方法获取 dio 实例
  static Dio get dio {
    Http();
    return _dio;
  }

  static List<String> noWithTokenUrl = ['api/auth/login', 'api/app/version'];

  // dio 拦截器
  // https://github.com/flutterchina/dio/blob/master/README-ZH.md#%E6%8B%A6%E6%88%AA%E5%99%A8
  void _addInterceptors(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String? token = Global.prefs.getString(StorageKey.token);

        if (token == null && !noWithTokenUrl.contains(options.path)) {
          Get.offAllNamed(AppRoutes.login);
          return;
        }
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.data is Map) {
          bool success = response.data['success'];
          if (success) return handler.next(response);
          // 业务失败的情况下返回 DioError 类型对象 => handleReject 会走到 onError 里面
          handler.reject(
            DioError(
              error: Exception(response.data['message']),
              type: DioErrorType.badResponse,
              requestOptions: response.requestOptions,
            ),
          );
        } else {
          // api 直接挂掉的情况
          handler.reject(
            DioError(
              error: Exception(
                  'Please make sure you are connected to the internet.'),
              type: DioErrorType.badResponse,
              requestOptions: response.requestOptions,
            ),
          );
        }
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));
  }
}
