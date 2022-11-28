import 'package:cleanarchitecture/main.dart';
import 'package:cleanarchitecture/module_data/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../module_data/services/user_api.dart';

part 'user_bloc.freezed.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.empty()) {
    //передаем начальное значение в super

    on<UserLoadEvent>(
      (event, emit) async {
        emit(const UserState.loading());

        try {
          final UserModel loadedUserList =
              await getIt<UserProvider>().getUsers();
          emit(UserState.loaded(loadedUser: loadedUserList));
        } catch (e) {
          print(e);
          emit(const UserState.error());
        }
      },
    );
    on<UserClearEvent>(
      (event, emit) async {
        emit(const UserState.empty());
      },
    );
  }
}
