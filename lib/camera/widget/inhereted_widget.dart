import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class DataWidget extends InheritedWidget {
  final List<XFile> pictures;
  const DataWidget({super.key, required this.pictures, required Widget child})
      : super(child: child);

  static List<XFile> of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<
        DataWidget>(); //когда в контекст будут приходить необходимые нам виджеты, этот контекст будет перестраиваться
    assert(result != null,
        'No DataWidget found in context'); //прерывается выполнение в виде сообщения, если условие false
    return result!.pictures;
  }

  @override
  bool updateShouldNotify(
          DataWidget
              oldWidget) => //фреймворк уведомляет виджеты, которые наследуются от приходящего виджета, что им нужно перестроиться, если данные не совпадают
      pictures != oldWidget.pictures;
}
