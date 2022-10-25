import 'package:flutter/material.dart';
import 'package:nnn/widgets/sign_in.dart';
import 'package:nnn/widgets/sign_up.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isSignIn = true;

  _changeWidget(bool isChanged) {
    setState(() {
      isSignIn = isChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    UniqueKey formKey = UniqueKey();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          isSignIn == true
              ? SignIn(
                  key: formKey,
                )
              : SignUp(
                  key: formKey,
                ),
        ]),
      ),
      floatingActionButton: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
        children: [
          SizedBox(
              width: 150,
              child: TextButton(
                style: TextButton.styleFrom(
                 
                ),
                  onPressed: () => _changeWidget(true), child: const Text('Вход'))),
                 
          TextButton(
              onPressed: () => _changeWidget(false),
              child: const Text('Регистрация')),
        ],
      ),
    );
  }
}
