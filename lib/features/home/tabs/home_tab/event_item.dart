import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/extensions/date_ex.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventItem extends StatefulWidget {
   EventItem({super.key, required this.event,required this.markedAsFavourites });
   bool markedAsFavourites ;

EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  late  bool favourite = widget.markedAsFavourites;
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  @override
  Widget build(BuildContext context) {

    return Container(padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 193.h,
      decoration: BoxDecoration(

        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageAssets.sportsLight,)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.event.dateTime.getDayMonthFromDateTime, style:Theme.of(context).textTheme.headlineSmall,),
              )),
          Spacer(),
          Card(

            child: Padding(
              padding:  REdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.event.description, style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,),
                  ),
                  IconButton(onPressed: (){

                    if(favourite){
                      FirebaseService.removeEventFromFavourite(widget.event);
                    }else{
                      FirebaseService.addEventToFavourite(widget.event);
                    }
                    favourite = !favourite;
                    setState(() {

                    });
                  }, icon: Icon(favourite ? Icons.favorite : Icons.favorite_border))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  
  

}
