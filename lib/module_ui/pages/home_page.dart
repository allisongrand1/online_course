
import 'package:cleanarchitecture/module_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child:  Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Users List')),
            ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(child: UserList()),
             /*  ActionButtons(), */
            ],
          ),
          bottomNavigationBar: const ActionButtons(),
        ),
      
    );
  }
}
