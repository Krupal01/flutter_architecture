import 'package:flutter/material.dart';
import 'package:flutter_architecture/model/model_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_cubit.dart';
import '../bloc/user_state.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context).fatchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination using bloc"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
           if (state is FatchUserState) {
             return ListView.builder(
              controller: scrollController,
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Text(state.userList[index].title.toString()),
                );
              },
            );
          }else {
            return Container();
          }
        },
      ),
    );
  }
}
