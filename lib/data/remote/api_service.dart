import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ApiService{
  Future<dynamic> get(String url , {Map<String,dynamic> queryParameters});
  Future<dynamic> post(String url , {Map data});
  Future<dynamic> delete(String url);
  Future<dynamic> patch(String url , Map data);
}