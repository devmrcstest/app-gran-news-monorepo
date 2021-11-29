import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/brightness_extension.dart';
import 'gran_colors_dark.dart';
import 'gran_colors_light.dart';
import 'gran_fonts.dart';

abstract class GranThemes {
  GranThemes._();

  static ThemeData get light {
    final GranColorsLight colors = GranColorsLight();
    return customTheme(
      brightness: Brightness.light,
      primarySwatch: colors.primary,
      primary: colors.primary,
      primaryVariant: colors.primaryDark,
      onPrimary: colors.white,
      secondary: colors.primary,
      secondaryVariant: colors.primaryDark,
      onSecondary: colors.white,
      background: colors.white,
      scaffoldBackground: colors.white,
      onBackground: colors.black,
      surface: colors.white,
      onSurface: colors.black,
      error: colors.red,
      onError: colors.white,
      disabledColor: colors.black.withOpacity(0.4),
      dividerColor: colors.black.withOpacity(0.12),
      dialogBackgroundColor: colors.white,
      bottomNavigationBarBackgroundColor: colors.white,
      inputFillColor: colors.primary.withOpacity(0.12),
      appBarBackgroundColor: colors.white,
      fontColor: colors.black,
    );
  }

  static ThemeData get dark {
    final GranColorsDark colors = GranColorsDark();

    return customTheme(
      brightness: Brightness.dark,
      primary: colors.primary,
      primarySwatch: colors.primary,
      primaryVariant: colors.primaryDark,
      onPrimary: colors.white,
      secondary: colors.primary,
      secondaryVariant: colors.primaryDark,
      onSecondary: colors.white,
      background: colors.black,
      scaffoldBackground: colors.black,
      onBackground: colors.white,
      surface: colors.black,
      onSurface: colors.white,
      error: colors.red,
      onError: colors.black,
      disabledColor: colors.white.withOpacity(0.4),
      dividerColor: colors.white.withOpacity(.32),
      dialogBackgroundColor: colors.black,
      bottomNavigationBarBackgroundColor: colors.black,
      inputFillColor: colors.black,
      appBarBackgroundColor: colors.black,
      fontColor: colors.white,
    );
  }

  static ThemeData customTheme({
    required Brightness brightness,
    // Primary
    required Color primary,
    required Color primaryVariant,
    required Color onPrimary,
    // Secondary
    required Color secondary,
    required Color secondaryVariant,
    required Color onSecondary,
    // Background
    required Color background,
    required Color scaffoldBackground,
    required Color onBackground,
    // Surface
    required Color surface,
    required Color onSurface,
    // Error
    required Color error,
    required Color onError,
    // Misc
    required Color disabledColor,
    required Color dividerColor,
    required Color dialogBackgroundColor,
    required Color bottomNavigationBarBackgroundColor,
    required Color appBarBackgroundColor,
    required Color inputFillColor,
    required Color fontColor,
    required MaterialColor primarySwatch,
  }) {
    return ThemeData(
      brightness: brightness,
      primarySwatch: primarySwatch,
      primaryColor: primary,
      primaryColorLight:
          brightness.isLight ? primarySwatch.shade300 : primarySwatch.shade900,
      primaryColorDark: primaryVariant,
      backgroundColor: background,
      scaffoldBackgroundColor: scaffoldBackground,
      cardColor: surface,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      dialogBackgroundColor: dialogBackgroundColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        secondary: secondary,
        background: background,
        surface: surface,
        error: error,
        primaryVariant: primaryVariant,
        secondaryVariant: secondaryVariant,
        onBackground: onBackground,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onError: onError,
        onSurface: onSurface,
      ),
      fontFamily: GranFonts.assistant,
      primaryTextTheme: const TextTheme(),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 98,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: primaryVariant,
        ),
        headline2: TextStyle(
          fontSize: 61,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: primaryVariant,
        ),
        headline3: TextStyle(
          fontSize: 49,
          fontWeight: FontWeight.w400,
          color: primaryVariant,
        ),
        headline4: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w400,
          color: primaryVariant,
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: primaryVariant,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: primaryVariant,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: primaryVariant,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: primaryVariant,
          letterSpacing: 0.1,
        ),
        bodyText1: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
        ),
        caption: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.4,
        ),
        overline: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        focusColor: primary,
        fillColor: inputFillColor,
        border: InputBorder.none,
        errorStyle: TextStyle(
          color: error,
        ),
        labelStyle: TextStyle(
          color: fontColor.withOpacity(.87),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: primary,
        backgroundColor: bottomNavigationBarBackgroundColor,
        unselectedItemColor: disabledColor,
        selectedLabelStyle: TextStyle(
          fontFamily: GranFonts.assistant,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: primaryVariant,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: GranFonts.assistant,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: disabledColor,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledColor: disabledColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        foregroundColor: primary,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.15,
          color: primaryVariant,
          fontFamily: GranFonts.assistant,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness.opposite,
          statusBarBrightness: brightness,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(onPrimary),
        fillColor: MaterialStateProperty.all<Color>(primary),
      ),
      iconTheme: IconThemeData(
        color: primary,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(secondary),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: brightness.isLight ? 4.0 : 0.0,
        shadowColor: primary.withOpacity(.2),
        color: surface,
        margin: EdgeInsets.zero,
      ),
    );
  }
}
