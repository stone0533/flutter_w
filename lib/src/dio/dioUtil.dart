import 'package:dio/dio.dart';

import 'httpConfig.dart';

class DioUtil {
  final String _baseUrl;
  final HttpConfig _config;
  final List<Interceptor> _interceptors;

  late Dio _dio;

  Dio get dio {
    return _dio;
  }

  DioUtil._internal(this._baseUrl, this._config, this._interceptors) {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _config.connectTimeout,
      receiveTimeout: _config.receiveTimeOut,
    );
    _dio = Dio(options);
    for (var element in _interceptors) {
      _dio.interceptors.add(element);
    }
  }

  static final Map<String, DioUtil> _dioUtils = {};

  static DioUtil instance(
    String baseUrl, {
    HttpConfig? config,
    List<Interceptor>? interceptors,
    List<Interceptor>? applyInterceptors,
  }) {
    if (!_dioUtils.containsKey(baseUrl)) {
      var inter = interceptors ?? [];
      if (applyInterceptors != null) {
        inter.addAll(applyInterceptors);
      }
      _dioUtils[baseUrl] = DioUtil._internal(baseUrl, config ?? HttpConfigBuilder().build(), inter);
    }
    return _dioUtils[baseUrl]!;
  }
}
