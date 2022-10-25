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

  group('Login form tests', () {
    late final FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Проверка валидации поля email при вводе', () async {
      await driver!.tap(emailField);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));
    });
    test('Проверка валидации поля phone при вводе', () async {
      await driver!.tap(phoneField);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('8800500600');
      await driver?.waitFor(find.text('8800500600'));
    });
    test('Проверка кнопки submit phone при нажатии', () async {
      await driver!.tap(submitButton);
      await driver?.waitFor(find.text('Добро пожаловать'));
      await driver!.tap(okayButton);
    });
  });

  group('Rigister form tests', () {
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
    test('Проверка валидации поля firstName при вводе', () async {
      await driver!.tap(firstNameField);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('Ivan');
      await driver?.waitFor(find.text('Ivan'));
    });
    test('Проверка валидации поля lastName при вводе', () async {
      await driver!.tap(lastNameField);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('Ivanov');
      await driver?.waitFor(find.text('Ivanov'));
    });
    test('Проверка валидации поля email при вводе', () async {
      await driver!.tap(emailField);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));
    });
    test('Проверка валидации поля phone при вводе', () async {
      await driver!.tap(phoneField);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('8800500600');
      await driver?.waitFor(find.text('8800500600'));
    });
    test('Проверка кнопки submit phone при нажатии', () async {
      await driver!.tap(submitButton);
      await driver?.waitFor(find.text('Вы успешно зарегистрировались'));
      await driver!.tap(okayButton);
    });
  });
}
