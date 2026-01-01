import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/auth/register/register_screen.dart';
import 'package:flutter/cupertino.dart';

abstract class RoutesManager{
  static const String login = '/login';
  static const String register = '/register';

  static Route? routeGeneration(RouteSettings settings){
    switch(settings.name){
      case login:{
        return CupertinoPageRoute(builder: (context)=> LoginScreen());
      }
      case register:{
        return CupertinoPageRoute(builder: (context)=> RegisterScreen());
      }
    }
  }
}