import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onTap});
final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontSize: 15.sp,
            color: ColorsManager.blue,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.blue,
            fontStyle: FontStyle.italic

        ),
      ),
    );
  }
}
