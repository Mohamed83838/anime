import 'package:chat_fraj/screens/videoplayer/component/component.dart';
import 'package:chat_fraj/screens/videoplayer/video_screen.dart';
import 'package:chat_fraj/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

//* card anime Widget
class card_anime extends StatefulWidget {
  const card_anime({Key? key, required this.url, required this.id, required this.title}) : super(key: key);
final String url;
final String id;
final String title;

  @override
  State<card_anime> createState() => _card_animeState();
}

class _card_animeState extends State<card_anime> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => video_screen()),
            );
      },
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 20)),
       
        decoration: BoxDecoration(
           color: Colors.transparent,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Container(
              height:screenHeight(context,dividedBy: 3.7),
            width: screenWidth(context,dividedBy: 2.7),
               
                decoration: BoxDecoration(
                  image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(widget.url),
            ),
                  borderRadius: BorderRadius.circular(20),
                ),
                    
              ),
              SizedBox(height: screenHeight(context,dividedBy: 100),),
             Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 13),)
          ],
        ),
        
           ),
    );
  }
}
class recent_card extends StatefulWidget {
  const recent_card({Key? key, required this.image, required this.title, required this.description}) : super(key: key);
  final String image;
  final String title;
  final String description;

  @override
  State<recent_card> createState() => _recent_cardState();
}

class _recent_cardState extends State<recent_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:screenWidth(context,dividedBy: 30),vertical: screenWidth(context,dividedBy: 70)),
      width: double.infinity,
      height: screenHeight(context,dividedBy: 9),
 decoration: BoxDecoration(
         color: Colors.transparent.withOpacity(0.4),

        borderRadius: BorderRadius.circular(20)
        
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(
            

            height:screenHeight(context,dividedBy: 12) ,
            width:screenHeight(context,dividedBy: 12) ,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                
                image: NetworkImage(widget.image))
            ),

          ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
                
                
                  Text(widget.title,style: TextStyle(color: Colors.grey,fontSize: 15),),
                
              
              Text(widget.description,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        Expanded(child: SizedBox()),
        IconButton(onPressed: (){}, icon: Icon(Icons.cancel,color: Colors.white,)),
        SizedBox(width: 5,)
        ],
      ),
    );
  }
}
//*recent Search screen user/anime
class user_avatar extends StatefulWidget {
  const user_avatar({Key? key, required this.id, required this.title, required this.url}) : super(key: key);
final String id;
final String title;
final String url;
  @override
  State<user_avatar> createState() => _user_avatarState();
}

class _user_avatarState extends State<user_avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
       height: 100,
            width: 80,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
             decoration: BoxDecoration(
               color: Colors.red,
               image: DecorationImage(image: NetworkImage(widget.url),
               fit: BoxFit.fill
               ),
    
              borderRadius: BorderRadius.circular(10)
              
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,),),

            ],
          )
        ],
      ),
    );
  }
}
class profile_picture extends StatefulWidget {
  const profile_picture({Key? key}) : super(key: key);

  @override
  State<profile_picture> createState() => _profile_pictureState();
}

class _profile_pictureState extends State<profile_picture> {
  @override
  Widget build(BuildContext context) {
    return  Container(
   
      margin: EdgeInsets.symmetric(horizontal: 10),
       height: 100,
        
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
             decoration: BoxDecoration(
               color: Colors.red,
               image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/R.e276c5e8747f4710070aa9b8fd61db6a?rik=gVcQ3kXORTkpUA&pid=ImgRaw&r=0"),
               fit: BoxFit.fill
               ),
    
              borderRadius: BorderRadius.circular(10)
              
            ),
          ),
         
        ],
      ),
    );
  }
}