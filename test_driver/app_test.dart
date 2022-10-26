import 'package:flutter_driver/flutter_driver.dart';

import 'package:test/test.dart';

void main() {
  final emailField = find.byValueKey('fieldEmail');
  final phoneField = find.byValueKey('fieldPhone');
  final firstNameField = find.byValueKey('fieldFirstName');
  final lastNameField = find.byValueKey('fieldLastName');
  final submitButton = find.text('Submit');
  final signUpButton = find.text('Регистрация');
  final okayButton = find.byValueKey('buttonOkay');

  group('Тесты формы входа', () {
    late final FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Проверка валидации пустых полей при нажатии на submit', () async {
      await driver!.tap(emailField);
      await driver?.enterText('');
      await driver?.waitFor(find.text(''));

      await driver!.tap(phoneField);
      await driver?.enterText('');
      await driver?.waitFor(find.text(''));

      await driver!.tap(submitButton);
      expect(await driver!.getText(find.text("Введите email")), "Введите email");
      expect(await driver!.getText(find.text("Введите телефон")), "Введите телефон");
    });

     test('Проверка валидации полей при корректном заполнении', () async {
      await driver!.tap(emailField);
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));

      await driver!.tap(phoneField);
      await driver?.enterText('8800500600');
      await driver?.waitFor(find.text('8800500600'));

      await driver!.tap(submitButton);
      await driver?.waitFor(find.text('Добро пожаловать'));
      await driver!.tap(okayButton);
      
    });

    test('Проверка валидации полей при некорректном заполнении', () async {
      await driver!.tap(emailField);
      await driver?.enterText('test');
      await driver?.waitFor(find.text('test'));

      await driver!.tap(phoneField);
      await driver?.enterText('8800500600');
      await driver?.waitFor(find.text('8800500600'));

      await driver!.tap(submitButton);
      expect(await driver!.getText(find.text("Поле email заполнено не корректно")),
          "Поле email заполнено не корректно");
    }); 
  });
 
  group('Тесты формы регистрации', () {
    late final FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });
     test('Переход на страницу регистрации при нажатии на кнопку "Регистрация"',
        () async {
      await driver!.tap(signUpButton);
    });
     test('Проверка валидации пустых полей при нажатии на submit', () async {
      await driver!.tap(firstNameField);
      await driver?.enterText('');
      await driver?.waitFor(find.text(''));

      await driver!.tap(lastNameField);
      await driver?.enterText('');
      await driver?.waitFor(find.text(''));

      await driver!.tap(emailField);
      await driver?.enterText('');
      await driver?.waitFor(find.text(''));

      await driver!.tap(phoneField);
      await driver?.enterText('');
      await driver?.waitFor(find.text(''));

      await driver!.tap(submitButton);
      expect(await driver!.getText(find.text("Введите имя")), "Введите имя");
      expect(await driver!.getText(find.text("Введите фамилию")), "Введите фамилию");
      expect(await driver!.getText(find.text("Введите email")), "Введите email");
      expect(await driver!.getText(find.text("Заполните поле телефон")), "Заполните поле телефон");
    });

    test('Проверка валидации полей при некорректном заполнении', () async {
      await driver!.tap(firstNameField);
      await driver?.enterText('Ivan');
      await driver?.waitFor(find.text('Ivan'));

      await driver!.tap(lastNameField);
      await driver?.enterText('Ivanov');
      await driver?.waitFor(find.text('Ivanov'));

      await driver!.tap(emailField);
      await driver?.enterText('test');
      await driver?.waitFor(find.text('test'));

      await driver!.tap(phoneField);
      await driver?.enterText('8800500600');
      await driver?.waitFor(find.text('8800500600'));
      await driver!.tap(submitButton);
      expect(await driver!.getText(find.text("Поле email заполнено не корректно")),
          "Поле email заполнено не корректно");
    });

    test('Проверка валидации полей при корректном заполнении', () async {
      await driver!.tap(firstNameField);
      await driver?.enterText('Ivan');
      await driver?.waitFor(find.text('Ivan'));

      await driver!.tap(lastNameField);
      await driver?.enterText('Ivanov');
      await driver?.waitFor(find.text('Ivanov'));

      await driver!.tap(emailField);
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));

      await driver!.tap(phoneField);
      await driver?.enterText('8800500600');
      await driver?.waitFor(find.text('8800500600'));

      await driver!.tap(submitButton);
      await driver?.waitFor(find.text('Вы успешно зарегистрировались'));
      await driver!.tap(okayButton);
    }); 
  }); 
}
