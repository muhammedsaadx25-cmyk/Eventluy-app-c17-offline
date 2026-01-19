import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences sharedPrefs;

  static Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode currentTheme) {
    String savedTheme = currentTheme == ThemeMode.light ? "Light" : "Dark";
    sharedPrefs.setString("theme_key", savedTheme);
  }

  static ThemeMode? getTheme() {
    String? savedTheme = sharedPrefs.getString("theme_key");
    if (savedTheme == null) {
      return null;
    }
    if (savedTheme == "Light") {
      return ThemeMode.light;
    }
    if (savedTheme == "Dark") {
      return ThemeMode.dark;
    }
  }


 static  void saveLang(String lang){
    sharedPrefs.setString("lang_key", lang);
  }


 static String?  getSavedLang(){
    return sharedPrefs.getString("lang_key");
  }
}
