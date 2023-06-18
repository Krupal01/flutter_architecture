import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';
import 'package:flutter_architecture/injection_conatainer.dart' as di;


class LoginView extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginCubit = di.di<LoginCubit>();

    return Scaffold(backgroundColor: Colors.white,
      body: BlocProvider(create: (context)=>loginCubit,
        child: BlocConsumer<LoginCubit, LoginState>(
          bloc: loginCubit,
          listener: (context, state) {
            if (state is LoginSuccess) {

              print("Login is sucess");
            } else if (state is LoginFailure) {
              print(state.error);

            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        loginCubit.login(
                          _usernameController.text,
                          _passwordController.text,
                        );
                      },
                      child: const Text('Login', style: TextStyle(color: Colors.black),),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),

    );
  }
}
