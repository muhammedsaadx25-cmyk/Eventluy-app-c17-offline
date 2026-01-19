import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/providers/lang_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
  ThemeMode activeTheme = ThemeMode.light;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Image.asset(ImageAssets.profilePic),
          Text("Muhammed Saad", style:Theme.of(context).textTheme.titleMedium ,),
          Text("Muhammed Saad", style:Theme.of(context).textTheme.labelSmall ,),

          SizedBox(height: 16.h,),
          // Container(
          //   padding: EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //     border: Border.all(width: 2, color: Theme.of(context).dividerColor),
          //     color:Theme.of(context).primaryColor,
          //     borderRadius: BorderRadius.circular(16.r)
          //   ),
          //   child: Row(
          //     children: [
          //       Text("Dark Model", style: Theme.of(context).textTheme.labelMedium,),
          //       Spacer(),
          //       Container(
          //         padding: EdgeInsets.all(8),
          //         decoration: BoxDecoration(
          //             border: Border.all(width: 2, color: Theme.of(context).dividerColor),
          //
          //             color:Theme.of(context).primaryColor,
          //             borderRadius: BorderRadius.circular(16.r)
          //         ),
          //         child: Row(
          //           children: [
          //             Text("Language", style: Theme.of(context).textTheme.labelMedium,),
          //             Spacer(),
          //
          //
          //
          //             DropdownButton<String>(
          //               underline: Container(),
          //               items: <String>["English", "Arabic"].map((value) {
          //                 return DropdownMenuItem<String>(
          //                   value: value,
          //                   child: Text(value),
          //                 );
          //               }).toList(),
          //               onChanged: (_) {},
          //             )
          //
          //
          //           ],
          //         ),
          //       ),
          //       // Switch(
          //       //     activeColor: Colors.white,
          //       //     activeTrackColor: Colors.grey,
          //       //     value: false, onChanged: (isDark){
          //       //
          //       //       print(isDark);
          //       //       //configProvider.changeAppTheme(ThemeMode.dark);
          //       // })
          //     ],
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Theme.of(context).dividerColor),

                color:Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16.r)
            ),
            child: Row(
              children: [
                Text("Theme", style: Theme.of(context).textTheme.labelMedium,),
                Spacer(),



                DropdownButton<String>(
                  underline: Container(),
                  items: <String>["Light", "Dark"].map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newTheme) {
                   themeProvider.changeAppTheme(newTheme == "Light"? ThemeMode.light : ThemeMode.dark);
                  },
                )


              ],
            ),
          ),

          SizedBox(height:16.h ,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Theme.of(context).dividerColor),

                color:Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16.r)
            ),
            child: Row(
              children: [
                Text("Language", style: Theme.of(context).textTheme.labelMedium,),
                Spacer(),



                DropdownButton<String>(
                  underline: Container(),
                  items: <String>["English", "Arabic"].map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newLang) {

                    langProvider.changeAppLang(newLang == "English" ? "en": "ar");
                  },
                )


              ],
            ),
          ),
          SizedBox(height:16.h ,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Theme.of(context).dividerColor),

                color:Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16.r)
            ),
            child: Row(
              children: [
                Text("Logout", style: Theme.of(context).textTheme.labelMedium,),
                Spacer(),



           Icon(Icons.logout, color: ColorsManager.red,)


              ],
            ),
          ),

        ],
      ),
    );
  }
}
