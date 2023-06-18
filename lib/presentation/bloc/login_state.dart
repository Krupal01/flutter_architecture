

import 'package:dio/dio.dart';

abstract class LoginState {

  final String  token;
  final bool noMoreData;
  final String? error;

  const LoginState({
    this.token = "" ,
    this.noMoreData = true,
    this.error,
  });

}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess({super.token});

}

class LoginFailure extends LoginState {
  const LoginFailure({super.error});
}