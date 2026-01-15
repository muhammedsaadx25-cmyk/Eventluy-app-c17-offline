import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,  this.labelText,  this.hintText,this.prefixIcon, this.suffixIcon, this.controller, this.validator, this.lines = 1});
final String? labelText;
final String? hintText;
final Widget? prefixIcon;
final Widget? suffixIcon;

final TextEditingController? controller;
final String? Function(String?)? validator;
final int lines ;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      maxLines:lines ,


      controller:controller ,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon ,
        suffixIcon:suffixIcon ,

      ),
    );
  }
}
