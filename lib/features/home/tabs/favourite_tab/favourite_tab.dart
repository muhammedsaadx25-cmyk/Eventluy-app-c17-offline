import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/home/tabs/home_tab/event_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(hintText: "Search For Event"),
            Expanded(

              child: ListView.separated(

                  itemBuilder: (_, index)=>  EventItem(event: EventModel(category: CategoryModel.categories[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", date: DateTime.now(), time: TimeOfDay.now())),
                  separatorBuilder: (_, index)=> SizedBox(height: 16.h,),
                  itemCount: 20),
            )
          ],
        ),
      ),
    );
  }
}
