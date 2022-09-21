import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ne'),
  ];

  static String getLang(String code) {
    switch (code) {
      case 'ne':
        return "Nepali";
      case 'en':
      default:
        return "English";
    }
  }
}
