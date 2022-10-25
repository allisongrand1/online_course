import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final message;
  const InfoDialog({super.key, this.message});

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: (widget.message == 'Добро пожаловать')
            ? const Text('Добро пожаловать')
            : const Text('Вы успешно зарегистрировались'),
        actions: [
          CupertinoDialogAction(
            key: const Key("buttonOkay"),
            child: const Text('Ок'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]);
  }
}
