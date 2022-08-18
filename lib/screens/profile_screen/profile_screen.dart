import 'package:chat_fraj/models/user_model.dart';

import 'package:chat_fraj/providers/user_provider.dart';
import 'package:chat_fraj/screens/login/login_screen.dart';
import 'package:chat_fraj/screens/profile_screen/component/component.dart';
import 'package:chat_fraj/screens/search_screen/component/component.dart';
import 'package:chat_fraj/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  late VideoPlayerController _controller;
  void dispose() {
   
    super.dispose();
    _controller.dispose();
  }

  void initState() {

    super.initState();

  context.read<User_Provider>().refreshUser();


    _controller = VideoPlayerController.asset("assets/rengoku.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setVolume(0);

        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    User user = context.watch<User_Provider>().user;
    return 
    
     ListView(
      children: [
        Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: screenHeight(context, dividedBy: 4) * 1.5,
                  width: screenWidth(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Positioned(
                child: profile_picture(),
                left: screenWidth(context) * 0.5 - 60,
                top: screenHeight(context, dividedBy: 10) * 3,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notifications_rounded,
                                  color: Colors.white))),
                      Expanded(child: SizedBox()),
                      CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.settings, color: Colors.white))),
                      SizedBox(
                      height: screenHeight(context)/10*0.2,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
         height: screenHeight(context)/10*0.65,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email,
                style: new TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[
                          Colors.redAccent,

                          Colors.red,
                          Colors.yellow,
                          //add more color here.
                        ],
                      ).createShader(
                          Rect.fromLTWH(100.0, 100.0, 200.0, 100.0))))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name,
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
        SizedBox(
      height: screenHeight(context)/10*0.2,
        ),
        Row(
          children: [profile_num(number:  0, title: '',), profile_num(number: 0, title: '',), profile_num(number: 0, title: '',)],
        ),
        SizedBox(
        height: screenHeight(context)/10*0.2,
        ),

        //*social media Section

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            profile_social(
                url: '',
                icon: Icon(
                  Icons.facebook,
                )),
            profile_social(
                url: '',
                icon: Icon(
                  Icons.facebook,
                )),
            profile_social(
                url: '',
                icon: Icon(
                  Icons.facebook,
                )),
          ],
        ),
       
        SizedBox(
          height: screenHeight(context)/10*0.2,
        ),
        //*favorite shows Section
        Align(
            alignment: FractionalOffset.bottomLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Favorite ",
                    style: GoogleFonts.arimo(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Text("Shows",
                    style: GoogleFonts.arimo(
                        color: Colors.white,
                        fontSize: 22,
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
          height: 15,
        ),
        //*
        Container(
          height: screenHeight(context, dividedBy: 3.3),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              card_anime(
                url: "https://s1.zerochan.net/Hatsume.Mei.600.2677039.jpg",
                id: '',
                title: '',
              ),
              card_anime(
                url:
                    "https://somoskudasai.com/wp-content/uploads/2021/06/E3DNh8AVgAMY7Og-min-scaled.jpg",
                title: '',
                id: '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//* clipper for the shape

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 1, size.height);
    path0.lineTo(size.width * 0.66, size.height);
    path0.lineTo(size.width * 0.66, size.height * 0.78);
    path0.lineTo(size.width * 0.34, size.height * 0.78);
    path0.lineTo(size.width * 0.34, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
