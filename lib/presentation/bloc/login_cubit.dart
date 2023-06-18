import '../../base/base_cubit.dart';
import '../../domain/model/request/login_request.dart';
import '../../domain/repository/user_repository.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState, String> {
  final UserRepository _userRepository;

  LoginCubit(this._userRepository) : super(const LoginInitial(), "");


  Future<void> login(String email, String password) async {
    if (isBusy) return;

    await run(() async {
      emit(const LoginLoading());
      try {
        final response = await _userRepository.login(
            LoginRequest(email, password)
        );

        if (response["token"] != null)  {
          final token = response.token;
          emit(LoginSuccess(token: token!));
        }else {
          emit( LoginFailure(error: response["error"].toString() ));
        }
      }catch(e){
        emit(LoginFailure(error: e.toString() ));
      }
    });
  }
}