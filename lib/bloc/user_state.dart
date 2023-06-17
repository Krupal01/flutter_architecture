
import '../model/model_post.dart';

abstract class UserState {
}

class InitUserState extends UserState {

}

class FatchUserState extends UserState {
  final List<Post> userList;

  FatchUserState(this.userList);
}

class ErrorUserState extends UserState {
  final String msg;
  ErrorUserState(this.msg);
}

class LoadingUserState extends UserState {}