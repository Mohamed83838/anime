import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


// *TEXT card
class profile_num extends StatefulWidget {
  const profile_num({Key? key, required this.title, required this.number}) : super(key: key);
final String title;
final int number;
  @override
  State<profile_num> createState() => _profile_numState();
}

class _profile_numState extends State<profile_num> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        children: [
          Text(widget.number.toString(),style: new TextStyle(
      fontSize: 15.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    )),
    Text("followers",style: new TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
      fontWeight: FontWeight.normal,
    ))
        ],
      ),
    );
  }
}
//* social media card
class profile_social extends StatefulWidget {
  const profile_social({Key? key, required this.icon, required this.url}) : super(key: key);

final Icon icon;
final String url;

  @override
  State<profile_social> createState() => _profile_socialState();
}

class _profile_socialState extends State<profile_social> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      
            height: 45,
            width: 45,
             decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
               borderRadius: BorderRadius.circular(10)
               ),
    
              child: Center(child: Icon(Icons.facebook,color: Colors.white,)),
              
            
          );
  }
}