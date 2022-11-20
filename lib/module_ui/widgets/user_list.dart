
import 'package:cleanarchitecture/module_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(listener: ((context, state) {
      if (state is UserLoadedState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Users is Loaded'), duration: Duration(seconds: 5)));
      }
    }), 
    builder: (context, state) {
      return state.when(
          empty: () => const Center(
                child: Text(
                  'Данные не получены. Пожалуйста, нажмите на "Load"',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (user) {
            return ListView.builder(
              itemCount: user.model.length,
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                child: ListTile(
                  leading: Text(
                    'ID: ${user.model[index].id}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    children: [
                      Text(
                        user.model[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Email: ${user.model[index].email}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Phone: ${user.model[index].phone}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: () => const Center(
                child: Text(
                  'Error fetching users',
                  style: TextStyle(fontSize: 20.0),
                ),
              ));
    });
  }
}
