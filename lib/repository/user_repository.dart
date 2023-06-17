import 'dart:convert';

import 'package:flutter_architecture/model/model_post.dart';
import 'package:flutter_architecture/repository/a_user_repository.dart';

import '../data/api_service.dart';

class UserRepositoryImpl extends UserRepository{

  final ApiService apiService;
  UserRepositoryImpl({required this.apiService});

  @override
  Future<List<Post>> getPost() async {
    var response = await apiService.getPost();
    return List<Post>.from(json.decode(response.body).map((x) => Post.fromJson(x)));
  }

}