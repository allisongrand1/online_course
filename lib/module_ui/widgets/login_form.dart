import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc_event.dart';
import '../src.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
                textDirection: TextDirection.ltr,
                text: const TextSpan(
                  style: TextStyle(
                    color: AppColors.softPeach,
                    fontWeight: FontWeight.w300,
                    fontSize: 28,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Yarn",
                    ),
                    TextSpan(
                        text: "Brand",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
            Column(
              children: [
                Container(
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                    )),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter minimum 6 characters'
                          : null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Password',
                      ),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(LogInAuthEvent(
                            key: formKey,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()));
                      },
                      child: Text("Sign In")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not Register?',
                      style: TextStyle(color: AppColors.softPeach),
                    ),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(InitialSignUpAuthEvent());
                        },
                        child: Text('Sign Up'))
                  ],
                )
              ],
            )
          ],
        ));
  }
}
