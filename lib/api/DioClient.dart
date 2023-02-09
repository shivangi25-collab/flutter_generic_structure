import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio? _dio;
  static Dio? _dioForDefaultBaseUrl;

  static Dio get client {
    if (_dio == null) {
      init();
    }
    return _dio!;
  }

  static Dio get dioClientForDefaultBaseUrl {
    if (_dioForDefaultBaseUrl == null) {
      initForDefaultBaseUrl();
    }
    return _dioForDefaultBaseUrl!;
  }

  static initForDefaultBaseUrl() {
    _dioForDefaultBaseUrl = Dio(BaseOptions(
      baseUrl: "",
      validateStatus: (status) {
        return status! <= 500;
      },
      headers: {
        'Accept': 'application/json',
      },
    ));

    _dioForDefaultBaseUrl!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );

    _dioForDefaultBaseUrl!.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions req, RequestInterceptorHandler handler) async {
      return handler.next(req);
    }, onResponse:
        (Response<dynamic> resp, ResponseInterceptorHandler handler) async {
      return handler.next(resp);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      return handler.next(error);
    }));
  }

  static init(){
  }





}
