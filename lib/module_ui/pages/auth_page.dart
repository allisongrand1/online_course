import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc_state.dart';
import 'package:work_with_firebase/module_ui/src.dart';
import 'package:work_with_firebase/module_ui/widgets/login_form.dart';
import 'package:work_with_firebase/module_ui/widgets/signup_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<BackgroudBloc, BackgroudState>(builder: (context, state) {
        return FutureBuilder(
            future: state.picture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      snapshot.data!,
                    ),
                    fit: BoxFit.cover,
                  )),
                  child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                    if (state is InitialSignInAuthState) {
                      return StreamBuilder(
                          stream: state.streamUsers,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              return HomePage();
                            } else if (snapshot.hasError) {
                              Center(
                                child: Text(snapshot.error.toString()),
                              );
                            }
                            return LogInForm();
                          });
                    } else if (state is InitialSignUpAuthState) {
                      return SignUpForm();
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
                );
              }
              return CircularProgressIndicator();
            });
      }),
    );
  }
}
