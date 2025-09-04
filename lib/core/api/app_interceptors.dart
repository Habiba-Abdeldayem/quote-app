import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptors extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    debugPrint("REQUEST[${options.method}] => PATH: ${options.path}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    debugPrint("RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    debugPrint("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
  }


}