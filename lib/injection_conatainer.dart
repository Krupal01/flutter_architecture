import 'package:flutter_architecture/bloc/user_cubit.dart';
import 'package:flutter_architecture/data/api_service.dart';
import 'package:flutter_architecture/repository/a_user_repository.dart';
import 'package:flutter_architecture/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {

  //cubits
  di.registerFactory(() => UserCubit(userRepository: di.call()));

  //repository
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(apiService: di.call()));

  //api service
  di.registerLazySingleton(() => ApiService());
}