import 'package:flutter_architecture/base/base_state.dart';
import 'package:flutter_architecture/base/result.dart';
import 'package:flutter_architecture/domain/model/response/error_response.dart';
import 'package:flutter_architecture/domain/model/response/login_response.dart';

import '../../base/base_cubit.dart';
import '../../domain/model/request/login_request.dart';
import '../../domain/repository/user_repository.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<BaseState, String> {
  final UserRepository _userRepository;

  LoginCubit(this._userRepository) : super(BaseInitState(), "");


  Future<void> login(String email, String password) async {
    if (isBusy) return;

    await run(() async {
      emit(LoadingState());
      try {
        final response = await _userRepository.login(
            LoginRequest(email, password)
        );

        if (response is Success)  {
          final token = ((response as Success).data as LoginResponse).token;
          emit(LoginState(token: token!));
        }
      }catch(e){
        emit(ErrorState(errorMessage: e.toString()));
      }
    });
  }
}