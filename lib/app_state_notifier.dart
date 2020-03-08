import 'package:flutter/material.dart';

class AppStateNotifier extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  bool isLight=true;

  void updateThemeNoNotify(bool isLight){
    this.isLight=isLight;
    this.themeMode=(isLight)?ThemeMode.light:ThemeMode.dark;
  }

  void updateTheme(bool isLight){
    this.isLight=isLight;
    this.themeMode=(isLight)?ThemeMode.light:ThemeMode.dark;
    notifyListeners();
  }
}