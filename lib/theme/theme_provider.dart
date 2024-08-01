import 'package:crud_isar_db/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  //initial theme
  ThemeData _themeData = lightMode;

//getter method to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

//getter method to see if we are in darkmode or not
  bool get isDarkMode => _themeData == darkMode;

  //setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle to be used later
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
