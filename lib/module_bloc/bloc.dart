import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc_event.dart';
import 'package:work_with_firebase/module_bloc/bloc_state.dart';
import 'package:work_with_firebase/module_data/repository/repository.dart';
import 'package:work_with_firebase/module_data/server/server.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadedHomeState(products: getIt<Service>().data)) {
    on<LoadingHomeEvent>((event, emit) {
      emit(LoadedHomeState(products: getIt<Service>().data));
    });
    on<LoadedHomeEvent>((event, emit) {
      emit(LoadedHomeState(products: getIt<Service>().data));
    });
    on<InCartHomeEvent>((event, emit) {
      emit(InCartHomeState(products: getIt<Service>().productsInCart));
    });
    on<NotInCartHomeEvent>((event, emit) {
      emit(NotInCartHomeState(products: getIt<Service>().productsNotInCart));
    });
    on<SignOutHomeEvent>((event, emit) => getIt<Service>().signOut);
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(InitialSignInAuthState(streamUsers: getIt<Service>().authUsers)) {
    on<InitialSignInAuthEvent>((event, emit) =>
        InitialSignInAuthState(streamUsers: getIt<Service>().authUsers));
    on<InitialSignUpAuthEvent>((event, emit) => emit(InitialSignUpAuthState()));
    on<LogInAuthEvent>((event, emit) {
      getIt<Service>()
          .signIn(event.email, event.password, event.key /* , event.context */);
      emit(InitialSignInAuthState(streamUsers: getIt<Service>().authUsers));
    });
    on<SignUpAuthEvent>((event, emit) {
      getIt<Service>()
          .signUp(event.email, event.password, event.key /* , event.context */);
      emit(InitialSignInAuthState(streamUsers: getIt<Service>().authUsers));
    });
  }
}

class BackgroudBloc extends Bloc<BackgroudEvent, BackgroudState> {
  BackgroudBloc()
      : super(BackgroudState(picture: getIt<Service>().loadPicture)) {}
}
