import 'package:cleanarchitecture/model/user.dart';
import 'package:cleanarchitecture/module_data/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc() : super(const UserState.empty()) { //передаем начальное значение в super
    final UserRepository userRepository = UserRepository();
    on<UserLoadEvent>(
      (event, emit) async {
        emit(const UserState.loading());

        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();
          emit(UserState.loaded(loadedUser: loadedUserList));
        } catch (_) {
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
