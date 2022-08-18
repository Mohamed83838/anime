import 'package:chat_fraj/screens/search_screen/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../anime/anime_methods.dart';
import '../../size.dart';

class result_screen extends StatefulWidget {
  const result_screen({Key? key}) : super(key: key);

  @override
  State<result_screen> createState() => _result_screenState();
}

class _result_screenState extends State<result_screen> {
  @override
  Widget build(BuildContext context) {
    //* text Section

    return Column(
      children: [
         Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text("Shows",
                style: GoogleFonts.arimo(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold)),
          
          ],
        ),
        SizedBox(height: 15,),
        //*results anime and shows
       Container(
      
        height: screenHeight(context,dividedBy: 3.2),
        width: screenWidth(context),
       child:  FutureBuilder(
        
        future: anime_methods().getall(),
        builder: (context, AsyncSnapshot snapshot){
          var data=snapshot.data;
          if(snapshot.data ==null){
            return Expanded(child:Text("jghujgh") ,);
          }else{

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,itemBuilder:
            
            (context,i){
              return card_anime(url:data[i].image, id:'' , title:data[i].title);
            }
             );
          }

        
      })
       ),
       SizedBox(height: 15,),


       //* result users

       
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text("User",
                style: GoogleFonts.arimo(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold)),
          
          ],
        ),
        SizedBox(height: 15,),
        Container(
          height: 100,
          child: FutureBuilder(
        
        future: anime_methods().getall(),
        builder: (context, AsyncSnapshot snapshot){
          var data=snapshot.data;
          if(snapshot.data ==null){
            return Expanded(child:Text("jghujgh") ,);
          }else{

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,itemBuilder:
            
            (context,i){
              return user_avatar(id: data[i].description, title: data[i].title, url: data[i].image);
            }
             );
          }

        
      })
        )
      ],
      


    );
  }
}