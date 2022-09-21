import 'package:flutter/material.dart';

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
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.light(),
    //textTheme: GoogleFonts.poppinsTextTheme(),
  );
  static final darkTheme = ThemeData(
      // textTheme: GoogleFonts.poppinsTextTheme(),
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      scaffoldBackgroundColor: Colors.grey.shade900);
}
