import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
    primaryColorDark: Colors.deepOrange[200],
    dialogTheme:
        const DialogTheme(elevation: 0, backgroundColor: Colors.black38),
    chipTheme: ChipThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.black54,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      showCheckmark: false,
      selectedColor: Colors.deepOrange[200],
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return Colors.deepOrange[200]!;
        }

        return Colors.black38;
      }),
      floatingLabelStyle: TextStyle(
        color: Colors.deepOrange[200],
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.deepOrange[200]!,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange[200],
            foregroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))))),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.deepOrange[200],
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        foregroundColor: Colors.deepOrange[200],
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 93, 93, 91),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        )),
    textTheme: _textLight(_themeLight.textTheme),
    cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.deepOrange[100],
        elevation: 15,
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.deepOrange[100]));

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(
        fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black54),
    bodyMedium: base.bodyMedium!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: const Color.fromARGB(255, 66, 55, 46)),
  );
}
