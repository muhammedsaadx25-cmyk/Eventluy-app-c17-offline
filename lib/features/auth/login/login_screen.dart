import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:evently/core/utils/ui_utils.dart';
import 'package:evently/core/utils/validator.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
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
                labelText: appLocalizations.email,
                prefixIcon: Icon(Icons.email),
              ),

              SizedBox(height: 16.h),
              CustomTextFormField(
                validator: Validator.validatePasswrod,
                controller: _passwordController,
                labelText: appLocalizations.password,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: 16.h),

              CustomElevatedButton(
                text: appLocalizations.login,
                onPress: _login,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appLocalizations.dont_have_an_account,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  CustomTextButton(
                    text: appLocalizations.sign_up,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.register,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: REdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconAssets.googleIcon),
                    SizedBox(width: 16.w),
                    Text(
                      appLocalizations.sign_up_with_google,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login()async {
    if (_formKey.currentState?.validate() == false) return;
   try {
      UIUtils.showLoading(context);
      UserCredential userCredential = await FirebaseService.login(email: _emailController.text, password: _passwordController.text);
  UserModel.loggedInUser  = await  FirebaseService.getUserFromFireStore(userCredential.user!.uid);

      UIUtils.hideDialog(context);
      UIUtils.showToastMessage(message: "User Logged-In Successfully",
          bgColor: Colors.green,
          fgColor: Colors.white);
      Navigator.pushReplacementNamed(context, RoutesManager.homeScreen);
    }on FirebaseAuthException catch(exception){
   UIUtils.hideDialog(context);UIUtils.showToastMessage(message: "Wrong email or password", bgColor: Colors.red, fgColor: Colors.white);
   }
  }
}
