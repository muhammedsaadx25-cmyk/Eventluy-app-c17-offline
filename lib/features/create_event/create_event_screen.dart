import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/extensions/date_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  DateTime eventDateTime = DateTime.now();
  TimeOfDay tempTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.sportsLight),

            SizedBox(height: 16.h),
            CustomTabBar(),
            SizedBox(height: 16.h),
            Text("Title", style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: 8.h),
            CustomTextFormField(hintText: "Event Title"),
            SizedBox(height: 16.h),
            Text("Description", style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: 8.h),
            CustomTextFormField(hintText: "Event Description", lines: 4),

            SizedBox(height: 16.h),
            Row(
              children: [
                Icon(Icons.date_range_outlined),
                SizedBox(width: 4.w),
                Text(
                  "Event Date",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Spacer(),
                CustomTextButton(text:eventDateTime.toFormattedDate, onTap: _chooseEventDate),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 4.w),
                Text(
                  "Event Time",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Spacer(),
                CustomTextButton(text: eventDateTime.getFormattedTime, onTap: _chooseEventTime),
              ],
            ),
            Spacer(),
            CustomElevatedButton(text: "Add Event", onPress: () {}),
          ],
        ),
      ),
    );
  }
  void _chooseEventDate()async {
   eventDateTime = await  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365))) ?? eventDateTime;
eventDateTime = eventDateTime.copyWith(hour: tempTime.hour, minute: tempTime.minute);
   setState(() {

   });
  }

  void _chooseEventTime()async {
   tempTime = await  showTimePicker(context: context, initialTime: TimeOfDay.now()) ?? tempTime;
   eventDateTime = eventDateTime.copyWith(hour: tempTime.hour, minute: tempTime.minute);
   setState(() {

   });
  }
}
