import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../anime/anime_methods.dart';
import '../../size.dart';
import 'component/component.dart';

class main_search_screen extends StatefulWidget {
  const main_search_screen({Key? key}) : super(key: key);

  @override
  State<main_search_screen> createState() => _main_search_screenState();
}

class _main_search_screenState extends State<main_search_screen> {
  @override
  Widget build(BuildContext context) {
    //* Text Section 
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "What you are",
            style: TextStyle(color: Colors.white, fontSize: 33),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "looking for?",
            style: TextStyle(color: Colors.white, fontSize: 33),
          ),
        ],
      ),
      SizedBox(
        height: screenHeight(context, dividedBy: 70),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Find your favorite Anime Between more?",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Than 10,000 Anime",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      SizedBox(
        height: screenHeight(context, dividedBy: 15),
      ),
      //* Top Anime Section
      Align(
          child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text("Top ",
              style: GoogleFonts.arimo(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          Text("Aring Anime",
              style: GoogleFonts.arimo(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w100)),
          Expanded(child: SizedBox()),
          Text("see all",
              style: GoogleFonts.arimo(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w300)),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 10,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      )),
      SizedBox(
        height: screenHeight(context, dividedBy: 30),
      ),
      Container(
        height: screenHeight(context, dividedBy: 3.3),
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
      SizedBox(
        height: screenHeight(context, dividedBy: 30),
      ),


      //* another Section

      
      Align(
          child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text("Summer  ",
              style: GoogleFonts.arimo(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          Text("2021 Anime",
              style: GoogleFonts.arimo(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w100)),
          Expanded(child: SizedBox()),
          Text("see all",
              style: GoogleFonts.arimo(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w300)),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 10,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      )),
      SizedBox(
        height: screenHeight(context, dividedBy: 30),
      ),
      Container(
        height: screenHeight(context, dividedBy: 3.3),
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
              return card_anime(url:data[i].image, id:'' , title:data[i].title);
            }
             );
          }

        
      })
      ),
    ]);
  }
}
