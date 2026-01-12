import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabItem extends StatelessWidget {
  TabItem({
    super.key,
    required this.label,
    required this.icon,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    required this.isSelected,
  });

  IconData icon;
  String label;
  Color selectedBgColor;
  Color selectedFgColor;
  Color unSelectedBgColor;
  Color unSelectedFgColor;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ?selectedBgColor : unSelectedBgColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon, color: isSelected ? selectedFgColor : unSelectedFgColor,),SizedBox(width: 4,), Text(label, style: GoogleFonts.poppins(fontSize: 16.sp,fontWeight: FontWeight.w500, color: isSelected ? selectedFgColor: unSelectedFgColor),)]),
    );
  }
}
