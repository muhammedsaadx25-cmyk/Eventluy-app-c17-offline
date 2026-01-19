import 'dart:ui';

import 'package:evently/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
 String currentLocal = PrefsManager.getSavedLang() ?? "en";
  void changeAppLang(String newLang){
    currentLocal = newLang;
    PrefsManager.saveLang(newLang);
    notifyListeners();
  }
}