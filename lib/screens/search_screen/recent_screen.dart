import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../anime/anime_methods.dart';
import '../../size.dart';
import 'component/component.dart';
//* recent Search widget

class recent_screen extends StatefulWidget {
  const recent_screen({Key? key, }) : super(key: key);

  @override
  State<recent_screen> createState() => _recent_screenState();
}

class _recent_screenState extends State<recent_screen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text("Recent ",
                style: GoogleFonts.arimo(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold)),
            Text("Searches",
                style: GoogleFonts.arimo(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w100)),
          ],
        )),
        SizedBox(
          height: 15,
        ),
        Container(
          height: screenHeight(context, dividedBy: 10) * 7,
          child:FutureBuilder(
        
        future: anime_methods().getall(),
        builder: (context, AsyncSnapshot snapshot){
          var data=snapshot.data;
          if(snapshot.data ==null){
            return Expanded(child:Text("jghujgh") ,);
          }else{

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,itemBuilder:
            
            (context,i){
              return recent_card(image: data[i].image, title: data[i].title, description: data[i].description);
            }
             );
          }

        
      })
        )
      ],
    );
  }
}
