import 'package:flutter_architecture/base/result.dart';
import 'package:flutter_architecture/data/remote/api_constant.dart';
import 'package:flutter_architecture/data/remote/api_service.dart';
import 'package:flutter_architecture/domain/model/request/login_request.dart';
import 'package:flutter_architecture/domain/model/response/error_response.dart';
import 'package:flutter_architecture/domain/model/response/login_response.dart';
import 'package:flutter_architecture/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final ApiService apiService;
  UserRepositoryImpl({required this.apiService});
  @override
  Future<Result<LoginResponse>> login(LoginRequest request) async {
    var response = await apiService.post(DioApiConstants.login , data : request.toJson());
    if(response?.statusCode == 200) {
      return Success(LoginResponse.fromJson(response?.data));
    }else{
      throw Exception(ErrorResponse.fromJson(response?.data ?? {"error","null response found"}).errorMessage);
    }
  }
}