import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,

    primarySwatch: Colors.blue,
    // colorScheme: ColorScheme.fromSwatch()
    //     .copyWith(primary: Colors.blue, secondary: Colors.yellow),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
  static final darkTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.dark(),
      scaffoldBackgroundColor: Colors.grey.shade900);
}
