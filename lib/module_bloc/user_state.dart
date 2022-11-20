

part of 'user_bloc.dart';

@freezed
class UserState with _$UserState{
    const factory UserState.empty() = UserEmptyState;
  const factory UserState.loading() = UserLoadingState;
  const factory UserState.loaded({required UserModel loadedUser}) = UserLoadedState;
  const factory UserState.error() = UserErrorState;
}
