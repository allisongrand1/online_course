import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/validate_email.dart';
import 'submit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('РЕГИСТРАЦИЯ'),
              TextFormField(
                key: const Key('fieldFirstName'),
                decoration: const InputDecoration(labelText: 'FirstName'),
                validator: (value) {
                  if (value == '') return 'Введите имя';
                  return null;
                },
              ),
              TextFormField(
                key: const Key('fieldLastName'),
                decoration: const InputDecoration(labelText: 'LastName'),
                validator: (value) {
                  if (value == '') return 'Введите фамилию';
                  return null;
                },
              ),
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
                  if (value == '') return 'Заполните поле телефон';
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
                      _formKey.currentState!.save();
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const InfoDialog(
                                message: 'Вы успешно зарегистрировались',
                              );
                            });
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
