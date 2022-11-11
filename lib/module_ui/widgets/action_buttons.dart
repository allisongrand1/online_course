
import 'package:cleanarchitecture/module_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
              userBloc.add(const UserLoadEvent());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeData.light().bottomAppBarColor,
            ),
            child: const Text('Load'),
          ),
        ),
        Container(
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
              userBloc.add(const UserClearEvent());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeData.dark().bottomAppBarColor,
            ),
            child: const Text('Clear'),
          ),
        ),
      ],
    );
  }
}
