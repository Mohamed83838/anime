import 'package:chat_fraj/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


//* Episode Card Widget
class video_screen_controller extends StatefulWidget {
  const video_screen_controller({Key? key, required this.id, required this.title, required this.url}) : super(key: key);
final String id;
final String title;
final String url;

  @override
  State<video_screen_controller> createState() => _video_screen_controllerState();
}

class _video_screen_controllerState extends State<video_screen_controller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent.withOpacity(0.2),
      margin: EdgeInsets.all(10),
    
child: Row(
  children: [
    Container(
      height: screenHeight(context,dividedBy: 8.5),
      width: screenWidth(context,dividedBy: 2.7),
        decoration: BoxDecoration(
            image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage("https://th.bing.com/th/id/R.28a2ab4286b04fabb1c77bfa0f5c2ced?rik=v1rLEkqbrKkfTg&pid=ImgRaw&r=0"),
      ),
            borderRadius: BorderRadius.circular(20),
          ),
    ),
    SizedBox(width: 7,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

  Text("Episode-01",style:  TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                
              
              Text("Niavana Matzu tdgujte ",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.normal),)
      ],
    )
  ],
),
    );
  }
}