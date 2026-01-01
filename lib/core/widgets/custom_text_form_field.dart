import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.labelText,  this.prefixIcon, this.suffixIcon, this.controller, this.validator});
final String labelText;
final Widget? prefixIcon;
final Widget? suffixIcon;
final TextEditingController? controller;
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller:controller ,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon ,
        suffixIcon:suffixIcon ,

      ),
    );
  }
}
