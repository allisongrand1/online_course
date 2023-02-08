import 'package:work_with_firebase/module_ui/src.dart';

abstract class HomeEvent {}

class LoadingHomeEvent implements HomeEvent {}

class LoadedHomeEvent implements HomeEvent {}

class InCartHomeEvent implements HomeEvent {}

class NotInCartHomeEvent implements HomeEvent {}

class SignOutHomeEvent implements HomeEvent {}

abstract class AuthEvent {}

class InitialSignInAuthEvent extends AuthEvent {}

class InitialSignUpAuthEvent extends AuthEvent {}

class LogInAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final GlobalKey<FormState> key;

  LogInAuthEvent(
      {required this.email, required this.password, required this.key});
}

class SignUpAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final GlobalKey<FormState> key;

  SignUpAuthEvent(
      {required this.email, required this.password, required this.key});
}

class BackgroudEvent {}
