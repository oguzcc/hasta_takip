import 'package:dio/dio.dart';

import '../../config/api_options.dart';
import '../../model/typedefs.dart';

class DioClient {
  // injecting dio instance
  DioClient(this._dio, this._apiOptions) {
    _dio
      ..options.baseUrl = _apiOptions.baseUrl
      ..options.connectTimeout = _apiOptions.connectionTimeout
      ..options.receiveTimeout = _apiOptions.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll([
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            options.headers['Authorization'] = 'Bearer $accessToken';
            options.headers['Accept-Language'] = locale;
            return handler.next(options);
          },
        ),
      ]);
  }

  static String accessToken = '';
  static String locale = 'en';
  final IApiOption _apiOptions;
  // dio instance
  final Dio _dio;
  // Get:-----------------------------------------------------------------------
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  AsyncResMap post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  AsyncResMap put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
