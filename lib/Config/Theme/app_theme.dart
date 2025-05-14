// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/app_colors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: AppColors().mainColor,
    scaffoldBackgroundColor: Color(0xfff2f5f8),
    cardColor: AppColors().whiteLight,
    secondaryHeaderColor: Color(0xffF1F2F5),
    shadowColor: AppColors().darkColor.withOpacity(0.2),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 40,
          color: Colors.black,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      displayMedium: TextStyle(
          fontSize: 35,
          color: AppColors().greyColorDark,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      displaySmall: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      titleLarge: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      titleMedium: TextStyle(
          fontSize: 20,
          color: AppColors().mainColor,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.normal),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    primaryColor: AppColors().mainColor,
    scaffoldBackgroundColor: Color(0xff18191A),
    cardColor: AppColors().whiteDark,
    secondaryHeaderColor: Color(0xff2D2E2F),
    shadowColor: Colors.black,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      displayMedium: TextStyle(
          fontSize: 35,
          color: AppColors().greyColorDark,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      displaySmall: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      titleMedium: TextStyle(
          fontSize: 20,
          color: AppColors().mainColor,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.w500),
      labelLarge: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.normal),
    ),
  );
}
