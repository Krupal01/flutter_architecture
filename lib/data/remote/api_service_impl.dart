import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/data/remote/api_constant.dart';
import 'package:flutter_architecture/data/remote/api_service.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../base/network_interceptor.dart';
import '../../base/retry_interceptor.dart';

class ApiServiceImpl implements ApiService{

  Dio? dio;
  Connectivity? connectivity;

  ApiServiceImpl._(){
    dio = Dio();
    connectivity = Connectivity();
    dio?.interceptors.add(NetworkInterceptor(
      retryInterceptor: RetryInterceptor(dio: dio, connectivity: connectivity),
    ));
    if (kDebugMode) {
      dio?.interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true, error: true,));
    }
  }

  static final ApiServiceImpl apiServiceImpl = ApiServiceImpl._();

  factory ApiServiceImpl() {
    return apiServiceImpl;
  }

  @override
  Future delete(String url) async {
    var response = await dio?.delete(DioApiConstants.baseUrl);
    return response;
  }

  @override
  Future get(String url, {Map<String, dynamic>? queryParameters}) async {
    var response = await dio?.get(DioApiConstants.baseUrl + url,queryParameters: queryParameters);
    return response?.data;
  }

  @override
  Future patch(String url, Map data) async {
    var response = await dio?.patch(DioApiConstants.baseUrl+url , data: data);
    return response?.data;
  }

  @override
  Future post(String url, {Map<dynamic, dynamic>? data}) async {
    var response = await dio?.post(DioApiConstants.baseUrl+url , data: data);
    return response?.data;
  }
  
}