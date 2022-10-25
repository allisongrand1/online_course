import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nnn/utils/validate_email.dart';
import 'submit.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('ВХОД'),
              TextFormField(
                key: const Key('fieldEmail'),
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == '') return 'Введите email';
                  if (!validateEmail(value!)) {
                    return 'Поле email заполнено не корректно';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const Key('fieldPhone'),
                validator: (value) {
                  if (value == '') return 'Введите телефон';
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const InfoDialog(
                              message: 'Добро пожаловать',
                            );
                          });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          )),
    );
  }
}
