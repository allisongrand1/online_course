part of '../theme.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool isDarkTheme = false;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  //изменяем состояние темы приложения
  toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.floralWhite,
      colorScheme: const ColorScheme(
        primary: AppColors.rose,
        secondary: AppColors.softPeach,
        background: AppColors.bridalHeath,
        brightness: Brightness.light,
        error: AppColors.error,
        onBackground: AppColors.bridalHeath,
        onError: AppColors.error,
        onPrimary: AppColors.darkrose,
        onSecondary: AppColors.softPeach,
        onSurface: AppColors.rose,
        surface: AppColors.rose,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 28,
        ),
        headline2: TextStyle(
          fontSize: 32,
        ),
        bodyText1: TextStyle(
          fontSize: 18,
        ),
        bodyText2: TextStyle(
          fontSize: 16,
        ),
      ).apply(
        fontFamily: 'Roboto Regular',
        displayColor: AppColors.textlight,
        decorationColor: AppColors.textlight,
        bodyColor: AppColors.textlight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      cardColor: AppColors.darkGrey,
      scaffoldBackgroundColor: AppColors.stormDust,
      colorScheme: const ColorScheme(
        primary: AppColors.sandDune,
        onPrimary: AppColors.darkGrey,
        secondary: AppColors.darkGrey,
        onSecondary: AppColors.darkGrey,
        background: AppColors.stormGrey,
        onBackground: AppColors.stormGrey,
        brightness: Brightness.light,
        error: AppColors.error,
        onError: AppColors.error,
        onSurface: AppColors.textdark,
        surface: AppColors.stormDust,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 28,
        ),
        headline2: TextStyle(
          fontSize: 32,
        ),
        bodyText1: TextStyle(
          fontSize: 18,
        ),
        bodyText2: TextStyle(
          fontSize: 16,
        ),
      ).apply(
        fontFamily: 'Roboto Regular',
        displayColor: AppColors.textdark,
        decorationColor: AppColors.textdark,
        bodyColor: AppColors.textdark,
      ),
    );
  }
}
