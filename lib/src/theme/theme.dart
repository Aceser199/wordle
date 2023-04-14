import 'package:flutter/material.dart';

class DmhTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xff00266b),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 0, 78, 154),
        primaryContainer: Color(0xff00266b),
        onPrimary: Colors.white,
        secondary: Color.fromARGB(255, 70, 70, 70), //326920 Prairie Gold - Dark
        secondaryContainer: Color(0xff753c00),
        onSecondary: Colors.white,
        error: Color(0xffE20000),
        onError: Colors.white,
        background: Colors.grey,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
        tertiary: Color.fromARGB(255, 120, 120, 120),
        onTertiary: Color.fromARGB(255, 70, 70, 70),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 28, 166, 223),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 28, 166, 223),
        onPrimary: Colors.white,
        secondary: Color.fromARGB(255, 28, 166, 223),
        onSecondary: Colors.white,
        error: Color(0xffE20000),
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Color.fromARGB(255, 70, 70, 70),
        onSurface: Colors.white,
      ),
      // colorScheme: ColorScheme.fromSwatch(
      //   brightness: Brightness.dark,
      //   accentColor: const Color.fromARGB(255, 28, 166, 223),
      //   primarySwatch: Colors.lightBlue,
      //   primaryColorDark: const Color.fromARGB(255, 28, 166, 223),
      //   errorColor: const Color(0xffE20000),
      //   backgroundColor: const Color(0xff00266b),
      //   // accentColor: const Color(0xFF13B9FF),
      // ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.fixed,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 70, 70, 70),
      ),
    );
  }
}
