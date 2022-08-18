import 'package:chat_fraj/screens/detail_screen/detail_screen.dart';
import 'package:chat_fraj/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

//**HomePage Card


class Continue_card extends StatefulWidget {
  const Continue_card({Key? key, required this.url, required this.season, required this.episode, required this.title, required this.id}) : super(key: key);
  final String url;
  final String season;
  final String episode;
  final String title;
  final String id;

  @override
  State<Continue_card> createState() => _Continue_cardState();
}

class _Continue_cardState extends State<Continue_card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => detail_screen(id: widget.id,)),
            );
      },
      child: Container(
        
        child: Container(
          
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: (screenWidth(context)/3)*1.6,
      
          child: Column(children: [
      Container(
        
            width:screenWidth(context),
            height: screenHeight(context,dividedBy:10)*1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.url),
        ),
              borderRadius: BorderRadius.circular(20),
            ),
                
          ),
          Linear_gradient(),
          
          SizedBox(height: screenWidth(context)/10*0.1,),
              Align(
            alignment: FractionalOffset.bottomCenter,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                
                Text(widget.title,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)
      
              ],
            )), 
              Align(
            alignment: FractionalOffset.bottomCenter,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                
                Text("Season ${widget.season} Episode ${widget.episode}",style:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 10),)
      
              ],
            )), 
      
      
          ]),
        ),
      ),
    );
  }
}

//**Progress Bar  


class Linear_gradient extends StatefulWidget {
  const Linear_gradient({Key? key}) : super(key: key);

  @override
  State<Linear_gradient> createState() => _Linear_gradientState();
}

class _Linear_gradientState extends State<Linear_gradient> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: MediaQuery.of(context).size.width/3*1.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
          Colors.white,
          Color.fromARGB(255, 71, 67, 67)
        ],
        stops: [
          0.1,
          0.5,
        ],
       ),
     ),
     child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        
       ),

       height: 3.0,
     ),
   );
  }
}