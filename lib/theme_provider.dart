import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppThemeProvider extends ChangeNotifier{
  // ThemeMode themeMode = SchedulerBinding.instance.window.platformBrightness==Brightness.dark ? ThemeMode.dark:ThemeMode.light;
  ThemeMode themeMode = ThemeMode.dark;
  bool scaffoldPhotoBackground = true;
  bool get isDarkMode => themeMode==ThemeMode.dark;
  bool get isScaffoldBackgroundPhoto => scaffoldPhotoBackground;

  void toggleTheme(bool darkMode){
    themeMode = darkMode ? ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }

  void toggleBackground(bool isPhoto){
    scaffoldPhotoBackground = isPhoto;
    notifyListeners();
  }

}