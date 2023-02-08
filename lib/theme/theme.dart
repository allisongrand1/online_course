import 'package:work_with_firebase/module_ui/src.dart';
import 'package:work_with_firebase/theme/src.dart';

ThemeData _lightTheme = ThemeData.light();

ThemeData lightTheme = _lightTheme.copyWith(
  primaryColor: AppColors.softPeach,
  inputDecorationTheme: InputDecorationTheme(
    iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
      return AppColors.hemp;
    }),
    floatingLabelStyle: TextStyle(
      color: AppColors.hemp,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: AppColors.hemp,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: AppColors.hemp,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: AppColors.hemp,
      ),
    ),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: AppColors.softPeach, width: 5.0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: TextStyle(fontWeight: FontWeight.w600),
          foregroundColor: AppColors.softPeach)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 30),
          elevation: 0,
          backgroundColor: AppColors.floralWhite,
          foregroundColor: AppColors.softPeach,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))))),
  appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.bridalHeath,
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )),
  textTheme: _textLight(_lightTheme.textTheme),
  cardTheme: const CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: AppColors.white,
      elevation: 0,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      )),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(
        fontWeight: FontWeight.w500, fontSize: 22, color: AppColors.darkrose),
    headlineSmall: base.headlineMedium!.copyWith(
        fontWeight: FontWeight.w500, fontSize: 26, color: AppColors.rose),
    bodyMedium: base.bodyMedium!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.darkrose),
    bodySmall: base.bodyMedium!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.white),
    titleMedium: base.titleMedium!.copyWith(
      color: AppColors.bridalHeath,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  );
}
