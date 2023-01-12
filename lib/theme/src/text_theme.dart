part of '../theme.dart';

TextTheme createTextTheme() {
  return const TextTheme(
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
  );
}
