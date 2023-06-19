

import 'package:dio/dio.dart';
import 'package:flutter_architecture/base/base_state.dart';

class LoginState extends BaseState {

  final String  token;

  const LoginState({
    this.token = ""
  });

}

