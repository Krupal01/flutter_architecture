import 'package:flutter/material.dart';
import 'package:flutter_architecture/bloc/user_cubit.dart';
import 'package:flutter_architecture/screen/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_conatainer.dart' as di;
import 'data/api_service.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: BlocProvider(create: (context) => di.di<UserCubit>(),child: const HomeScreen()),
    );
  }
}

