import 'dart:convert';

import 'package:flutter_architecture/model/model_post.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<http.Response> getPost() async{
    return await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  }
}