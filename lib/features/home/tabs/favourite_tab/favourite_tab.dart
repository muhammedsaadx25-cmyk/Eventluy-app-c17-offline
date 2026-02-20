import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/home/tabs/home_tab/event_item.dart';
import 'package:evently/firebase/firebase_service.dart';
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
            SizedBox(height: 16.h,),


            FutureBuilder(future: FirebaseService.getFavouriteEvents(), builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              if(snapshot.hasError){
                return Text("Error occurred");
              }
              List<EventModel> favouriteEvents = snapshot.data ?? [];
              return   Expanded(

                child: ListView.separated(

                    itemBuilder: (_, index)=>  EventItem(event:favouriteEvents[index], markedAsFavourites: true,),
                    separatorBuilder: (_, index)=> SizedBox(height: 16.h,),
                    itemCount: favouriteEvents.length),
              );
            })

          ],
        ),
      ),
    );
  }
}
