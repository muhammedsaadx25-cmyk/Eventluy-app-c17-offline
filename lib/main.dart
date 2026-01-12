import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp( Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(393, 841) ,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,_)=> MaterialApp(
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.homeScreen,
        onGenerateRoute: RoutesManager.routeGeneration,
      ),

    );
  }
}
