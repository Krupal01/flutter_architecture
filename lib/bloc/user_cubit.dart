import 'package:flutter_architecture/bloc/user_state.dart';
import 'package:flutter_architecture/data/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/a_user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit({required this.userRepository}) : super(InitUserState());

  Future<void> fatchUsers() async {
    emit(LoadingUserState());

    try {
      Future.delayed(Duration(seconds: 2));
      final response = await userRepository.getPost();
      emit(FatchUserState(response));
    } catch (e) {
      emit(ErrorUserState(e.toString()));
    }
  }
}