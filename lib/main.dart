import 'dart:ui';

import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/prefs_manager/prefs_manager.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/lang_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   await PrefsManager.init();
  await Firebase.initializeApp();
if(FirebaseAuth.instance.currentUser != null){
  UserModel.loggedInUser =await  FirebaseService.getUserFromFireStore(FirebaseAuth.instance.currentUser!.uid);

}
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider()),
        ChangeNotifierProvider(create: (context)=> LanguageProvider()),
      ],
      child: Evently()));

}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {

    print(window.locale);
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);
    print(themeProvider.currentTheme);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize:Size(393, 841) ,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,_)=> MaterialApp(
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: themeProvider.currentTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser == null ?  RoutesManager.login: RoutesManager.homeScreen,
        onGenerateRoute: RoutesManager.routeGeneration,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        locale: Locale(languageProvider.currentLocal)
      ),

    );
  }
}
