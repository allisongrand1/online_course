import 'package:flutter/material.dart';

ThemeData basicTheme() => ThemeData(
   primaryColor: const Color(0xFFF43F5E),
    brightness: Brightness.light,
    textTheme: ThemeData.light().textTheme.copyWith(
        titleLarge: const TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 18,
            fontWeight: FontWeight.w600)),
          
    appBarTheme: const AppBarTheme(
      
      toolbarHeight: 110,
      elevation: 0,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
          fontFamily: 'SourceSansPro',
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(
             color: Color(0xFFF43F5E),
            
          ),
    ));
