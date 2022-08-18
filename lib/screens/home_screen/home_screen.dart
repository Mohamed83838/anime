import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../anime/anime_methods.dart';
import '../../providers/user_provider.dart';
import '../../size.dart';
import 'component/component.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  final _controlller = PageController();
  late VideoPlayerController _controller;
  void dispose() {
   
    super.dispose();
    _controller.dispose();
  }

  void initState() {
  

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    super.initState();
      context.read<User_Provider>().refreshUser();
    _controller = VideoPlayerController.asset("assets/demon.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setVolume(0);
        _controller.setLooping(true);
       
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return ListView(
      children: [
    
        //* *Annonce Section
        Stack(children: [
          Container(
            width: screenWidth(context),
            height: screenWidth(context) / 3 * 2.4,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
              child: VideoPlayer(_controller),
            ),
          ),
          Column(
            children: [
             
              SizedBox(
                height: (screenWidth(context)) / 3 * 1.3,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(context)/10*0.5,
                  ),
                  Text("Demon",
                      style: GoogleFonts.bahiana(
                          color: Colors.white, fontSize: 40)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(context)/10*0.7,
                  ),
                  Text("Slayer",
                      style: GoogleFonts.bahiana(
                          color: Colors.white, fontSize: 40)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                 width: screenWidth(context)/10*0.7,
                  ),
                  Text("Demon Slayer",
                      style: GoogleFonts.arimo(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 13,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
           
            ],
          ),
        ]),
        SizedBox(height: 15),
    
    
    
    //**Continue watching Section
    
    
        Align(
            alignment: FractionalOffset.bottomLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Continue ",
                    style: GoogleFonts.arimo(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Text("Watching",
                    style: GoogleFonts.arimo(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300)),
                Expanded(child: SizedBox()),
                Text("See all",
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
                )
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Container(
            height: (screenHeight(context) / 10) * 2.2,
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
              return Continue_card(url:data[i].image , season: data[i].description, episode: "gfg", title: data[i].title, id: "");
            }
             );
          }

        
      })),
    
    
    
            //** Upcoming Section
    
    
        Align(
            child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text("Up",
                style: GoogleFonts.arimo(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Text("coming",
                style: GoogleFonts.arimo(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w300)),
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
            )
          ],
        )),
        SizedBox(
          height: screenHeight(context) / 10 * 0.1,
        ),
        Container(
            height: (screenHeight(context) / 10) * 2.8,
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
              return Continue_card(url:data[i].image , season: data[i].description, episode: "gfg", title: data[i].title, id: "");
            }
             );
          }

        
      })),
      ],
    );
  }
}
