import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/features/home/tabs/home_tab/event_item.dart';
import 'package:evently/features/home/tabs/home_tab/tab_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back ✨",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Muhammed Saad",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.light_mode, color: ColorsManager.darkBlue),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: REdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      child: Text(
                        "EN",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
         CustomTabBar(),
           Expanded(
             child: ListView.separated(
                 itemBuilder: (context, index)=> EventItem(event: EventModel(category: CategoryModel.categories[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", date: DateTime.now(), time: TimeOfDay.now()),),
                 separatorBuilder: (context, index)=> SizedBox(height: 16.h,
                 ),
                 itemCount: 20),
           )
          ],
        ),
      ),
    );
  }
}
