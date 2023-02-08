abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final Stream<List>? products;

  LoadedHomeState({this.products});
}

class InCartHomeState extends HomeState {
  final Stream<List>? products;

  InCartHomeState({this.products});
}

class NotInCartHomeState extends HomeState {
  final Stream<List>? products;

  NotInCartHomeState({this.products});
}

abstract class AuthState {}

class InitialSignInAuthState extends AuthState {
  Stream streamUsers;

  InitialSignInAuthState({required this.streamUsers});
}

class InitialSignUpAuthState extends AuthState {}

class LogInAuthState extends AuthState {
  final Future signIn;
  LogInAuthState({required this.signIn});
}

class SignUpAuthState extends AuthState {
  final Future signUp;
  SignUpAuthState({required this.signUp});
}

class BackgroudState {
  Future<String> picture;

  BackgroudState({required this.picture});
}
