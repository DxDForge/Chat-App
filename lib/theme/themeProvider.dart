import 'package:chat_train02/theme/darkTheme.dart';
import 'package:chat_train02/theme/lightTheme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  //initial theme data
ThemeData _themeData = lightTheme;

//get the theme
ThemeData get themeData => _themeData;

//check is it darkMode or not
bool get isDarkMode => _themeData == darkTheme;

//set theme
 set themeData(ThemeData themeData)
 {
  _themeData = themeData;
  notifyListeners();
  
}

//toggle method to change theme
void toggleTheme(){
  if (_themeData == lightTheme) {
    themeData = darkTheme;
  }else{
    themeData = lightTheme;
  }
}
}
