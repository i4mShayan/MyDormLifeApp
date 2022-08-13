import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppThemeProvider extends ChangeNotifier{
  // ThemeMode themeMode = SchedulerBinding.instance.window.platformBrightness==Brightness.dark ? ThemeMode.dark:ThemeMode.light;
  ThemeMode themeMode = ThemeMode.dark;
  bool scaffoldPhotoBackground = true;
  bool get isDarkMode => themeMode==ThemeMode.dark;
  bool get isScaffoldBackgroundPhoto => scaffoldPhotoBackground;
  int get themeID => themeMode==ThemeMode.light ? 0 : themeMode==ThemeMode.dark ? 1:2;

  void toggleTheme(bool darkMode){
    themeMode = darkMode ? ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }

  void changeTheme(int themeID){
    themeMode = themeID==0 ? ThemeMode.light: themeID==1 ? ThemeMode.dark:ThemeMode.system;
    notifyListeners();
  }


  void toggleBackground(bool isPhoto){
    scaffoldPhotoBackground = isPhoto;
    notifyListeners();
  }

}