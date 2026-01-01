
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:evently/core/utils/validator.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/custom_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
 _emailController.dispose();
 _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(ImageAssets.eventlyLogo),
              SizedBox(height: 24.h),
              CustomTextFormField(
                validator: Validator.validateEmail,
                controller: _emailController,
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),

              SizedBox(height: 16.h),
              CustomTextFormField(
                validator: Validator.validatePasswrod,
                controller: _passwordController,
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: 16.h),

              CustomElevatedButton(text: "Login", onPress:_login),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t Have Account? ", style: Theme.of(context).textTheme.bodySmall,),
                  CustomTextButton(text: "Create Account", onTap: (){
                    Navigator.pushReplacementNamed(context, RoutesManager.register);
                  }),

                ],
              ),
              SizedBox(height: 16.h,),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(


                    padding: REdgeInsets.symmetric(vertical: 16)
                  ),
                  onPressed: (){}, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Image.asset(IconAssets.googleIcon),
                  Text("Login With Google", style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.blue),)
                ],
              ))

            ],
          ),
        ),
      ),
    );
  }


  void _login(){
    if(_formKey.currentState?.validate() == false) return ;
  }
}
