import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:evently/core/utils/validator.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
late TextEditingController _nameController ;

late TextEditingController _emailController ;

late TextEditingController _passwordController ;

late TextEditingController _rePasswordController ;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
@override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(ImageAssets.eventlyLogo),
              SizedBox(height: 24.h),
              CustomTextFormField(
                validator: Validator.validateName,
                controller: _nameController,
                labelText: "Name",
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
               validator: Validator.validateEmail,
                controller: _emailController,
                labelText: "E-mail",
                prefixIcon: Icon(Icons.mail),
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
              CustomTextFormField(
                validator: (input){
                  if(input == null || input.trim().isEmpty){
                    return "Plz, enter re-password";
                  }

                  if(input != _passwordController.text){
                    return "Password doesn't match";
                  }

                  return null;

                },
                controller: _rePasswordController,
                labelText: "Re-Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: 16.h),
              CustomElevatedButton(text: "Create Account", onPress:_createAccount),
                SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have Account? ", style: Theme.of(context).textTheme.bodySmall,),
                CustomTextButton(text: "Login", onTap: (){
                  Navigator.pushReplacementNamed(context, RoutesManager.login);
                }),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  void  _createAccount() {
   if(_formKey.currentState?.validate() == false) return;
  }
}
