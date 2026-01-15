import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.darkBlue,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.blue
      ),
      backgroundColor: ColorsManager.white,
        centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: ColorsManager.blue)
    ),
    scaffoldBackgroundColor: ColorsManager.primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.primary,
      selectedItemColor: ColorsManager.darkBlue,
      unselectedItemColor:  ColorsManager.grey
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkBlue,
      foregroundColor: ColorsManager.white,
      shape: CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationTheme(

      labelStyle: GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey,),
      hintStyle: GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey,),

      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.blue, width: 1.w)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r)
        ),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: ColorsManager.blue,
            width: 2.w
          )
        )
      )
    ),
    cardTheme:  CardThemeData(

      color: ColorsManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      )
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.poppins(fontSize: 14.sp, color: ColorsManager.black, fontWeight: FontWeight.w400),
      titleMedium: GoogleFonts.poppins(fontSize: 20.sp, color: ColorsManager.black, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.inter(fontSize:16.sp, color: ColorsManager.black, fontWeight: FontWeight.w500 ),
      bodyMedium: GoogleFonts.poppins(fontSize:14.sp, color: ColorsManager.black, fontWeight: FontWeight.w500 ),

    )
    ,
  );
  static final ThemeData dark = ThemeData();
}