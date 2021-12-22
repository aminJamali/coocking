import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'parameters.dart';

class AdvanceHttpClient {
  final String baseUrl;
  final String? exceptionPrefix;
  Dio? _dio;
  final void Function(String exceptionKey) handleExceptionCallBack;
  final bool disableGeneralInterceptor;

  AdvanceHttpClient({
    required final this.baseUrl,
    required final this.handleExceptionCallBack,
   final this.disableGeneralInterceptor = false,
    final this.exceptionPrefix,
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      sendTimeout: 10000,
      headers:{'authorization':'Bearer ${Parameters.token}'}
    );

    _dio = Dio(options);

  }

  Options get _options => Options();

  String _getDioErrorResponseKey(final Response<dynamic> response) {
    if (response.statusCode == 500) {
      return response.data['error'];
    }

    return '${exceptionPrefix ?? ''}${response.statusCode ?? 'other'}';
  }

  String _getErrorKey(final DioError dioError) {
    String exceptionKey;
    switch (dioError.type) {
      case DioErrorType.response:
        return _getDioErrorResponseKey(dioError.response!);
      case DioErrorType.cancel:
        exceptionKey = 'cancel';
        break;
      case DioErrorType.connectTimeout:
        exceptionKey = 'connectTimeout';
        break;
      case DioErrorType.sendTimeout:
        exceptionKey = 'sendTimeout';
        break;
      case DioErrorType.receiveTimeout:
        exceptionKey = 'receiveTimeout';
        break;
      case DioErrorType.other:
        exceptionKey = 'other';
        break;
    }
    return '${exceptionPrefix ?? ''}$exceptionKey';
  }

  Future<Either<String, dynamic>> get(
      final String url, {
       final bool disableHandleException = false,
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
        Options? options,
        final CancelToken? cancelToken,
        final ProgressCallback? onSendProgress,
        final ProgressCallback? onReceiveProgress,
      }) async {
    options ??= _options;
    try {
      final Response<dynamic> response = await _dio!.get(
        '$baseUrl$url',
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return _onDioSuccess(response);
    } on DioError catch (dioError) {
      return _onDioError(dioError, disableHandleException);
    }
  }

  Future<Either<String, dynamic>> post(
      final String url, {
       final bool disableHandleException = false,
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
        Options? options,
        final CancelToken? cancelToken,
        final ProgressCallback? onSendProgress,
        final ProgressCallback? onReceiveProgress,
      }) async {
    options ??= _options;
    try {
      final Response<dynamic> response = await _dio!.post(
        '$baseUrl$url',
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _onDioSuccess(response);
    } on DioError catch (dioError) {
      return _onDioError(dioError, disableHandleException);
    }
  }

  Future<Either<String, dynamic>> put(
      final String url, {
       final bool disableHandleException = false,
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
        Options? options,
        final CancelToken? cancelToken,
        final ProgressCallback? onSendProgress,
        final ProgressCallback? onReceiveProgress,
      }) async {
    options ??= _options;
    try {
      final Response<dynamic> response = await _dio!.put('$baseUrl$url',
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return _onDioSuccess(response);
    } on DioError catch (dioError) {
      return _onDioError(dioError, disableHandleException);
    }
  }

  Future<Either<String, dynamic>> patch(
      final String url, {
        final  bool disableHandleException = false,
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
        Options? options,
        final CancelToken? cancelToken,
        final ProgressCallback? onSendProgress,
        final ProgressCallback? onReceiveProgress,
      }) async {
    options ??= _options;
    try {
      final Response<dynamic> response = await _dio!.patch('$baseUrl$url',
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return _onDioSuccess(response);
    } on DioError catch (dioError) {
      return _onDioError(dioError, disableHandleException);
    }
  }

  Future<Either<String, dynamic>> delete(
      final String url, {
        final bool disableHandleException = false,
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
        Options? options,
        final CancelToken? cancelToken,
        final ProgressCallback? onSendProgress,
        final ProgressCallback? onReceiveProgress,
      }) async {
    options ??= _options;
    try {
      final Response<dynamic> response = await _dio!.delete(
        '$baseUrl$url',
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return _onDioSuccess(response);
    } on DioError catch (dioError) {
      return _onDioError(dioError, disableHandleException);
    }
  }

  Left<String, dynamic> _onDioError(
      final DioError dioError, final bool disableHandleException) {
    print(dioError.requestOptions.path);
    print(dioError.requestOptions.data);
    print('${dioError.response!.statusCode} ${dioError.response!.statusMessage}');
    if (dioError.response!.statusCode==500){
      print('"error": ${dioError.response!.data['error']}');
      print('"description": ${dioError.response!.data['description']}');
    }

    final String exception = _getErrorKey(dioError);
    if (!disableHandleException) {
      handleExceptionCallBack.call(exception);
    }
    return Left(exception);
  }
  Right<String, dynamic> _onDioSuccess(
      final Response<dynamic> response) {
    print(response.requestOptions.path);
    print(response.statusCode);
    print(response.data);
    return Right(response.data);
  }
}
