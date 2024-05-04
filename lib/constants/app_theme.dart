import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xffEC5252),
      ),
      primaryColor: Color(0xffEC5252),
      scaffoldBackgroundColor: Color(0xffF5F9FA),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xffEC5252),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: .2,
          centerTitle: true,
          foregroundColor: Colors.black),textTheme:textTheme );
}

var textTheme = TextTheme(
  displayLarge: GoogleFonts.nunito(
      fontSize: 97,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: Colors.black),
  displayMedium: GoogleFonts.nunito(
      fontSize: 61,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: Colors.black87),
  displaySmall: GoogleFonts.nunito(fontSize: 48, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.nunito(
      fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall:
      GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.nunito(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.nunito(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.black),
  bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.black87),
  labelLarge: GoogleFonts.nunito(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
);


