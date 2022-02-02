import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ColorPalletes {
  static var primaryColor = const Color(0xFF1a5cff);
  static var successColor = const Color(0xFF12AE67);
  static var warningColor = const Color(0xFFFFCA60); //ffba00
  static var errorColor = const Color(0xFFff4757);
  static var grayColor = const Color(0xFF777779);
  static var bgLightColor = const Color(0xFFf6f6f6);
  static var bgGrayColor = const Color(0xFFf4f7f8);
  static var bgDarkColor = const Color(0xFF151418);

  static var blackFont = const Color(0xFF2c3e50);
}

abstract class ThemeMode {
  static final light = ThemeData.light().copyWith(
    backgroundColor: ColorPalletes.bgLightColor,
    scaffoldBackgroundColor: ColorPalletes.bgLightColor,
    primaryColor: ColorPalletes.primaryColor,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalletes.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorPalletes.primaryColor,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: ColorPalletes.bgDarkColor,
    buttonTheme: ButtonThemeData(buttonColor: ColorPalletes.primaryColor),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorPalletes.primaryColor,
      foregroundColor: Colors.white,
    ),
  );
}

abstract class AppTextStyle {
  static var bigTitle = GoogleFonts.oxygen(
    fontWeight: FontWeight.w700,
    fontSize: 46,
    letterSpacing: 0.5,
    height: 1.2,
    color: ColorPalletes.blackFont,
  );

  static var title = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: 0.5,
    height: 1.2,
    color: ColorPalletes.blackFont,
  );

  static var normal = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0.5,
    height: 1.2,
    color: ColorPalletes.blackFont,
  );

  static var small = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    letterSpacing: 0.3,
    height: 1.2,
    color: ColorPalletes.blackFont,
  );
}

abstract class AppShadow {
  static var card = const BoxShadow(
    color: Color(0x00000014),
    blurRadius: 20,
    spreadRadius: 3,
    offset: Offset(0, 3),
  );
}
