import 'package:flutter_architecture/data/remote/api_service.dart';
import 'package:flutter_architecture/data/remote/api_service_impl.dart';
import 'package:flutter_architecture/data/repository/user_repository_impl.dart';
import 'package:flutter_architecture/presentation/bloc/login_cubit.dart';
import 'package:get_it/get_it.dart';

import 'domain/repository/user_repository.dart';

final di = GetIt.instance;

Future<void> init() async {

  di.registerFactory(() => LoginCubit(di.call()));

  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(apiService: di.call()));

  di.registerLazySingleton<ApiService>(() => ApiServiceImpl());
}