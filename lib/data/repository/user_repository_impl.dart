import 'package:flutter_architecture/data/remote/api_constant.dart';
import 'package:flutter_architecture/data/remote/api_service.dart';
import 'package:flutter_architecture/domain/model/request/login_request.dart';
import 'package:flutter_architecture/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final ApiService apiService;
  UserRepositoryImpl({required this.apiService});
  @override
  Future login(LoginRequest request) async {
    return await apiService.post(DioApiConstants.login , data : request.toJson());
  }
}