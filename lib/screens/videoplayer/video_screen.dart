import 'dart:math';

import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../size.dart';
import 'component/component.dart';

class video_screen extends StatefulWidget {
  const video_screen({Key? key}) : super(key: key);

  @override
  State<video_screen> createState() => _video_screenState();
}

class _video_screenState extends State<video_screen> {
  @override
  //!global variable
  String position_second = "0";
  String position_minute = "0";
  String duration_second = "0";
  double duration_min = 1.0;
  double duration_sec = 0.0;
  double position_min = 0.0;
  double position_sec = 0.0;
  String duration_minute = "0";
  bool is_playing = false;
  double position_milli = 0.0;
  double duration_milli = 0.0;
  double _progress = 0.0;
  bool is_finished = false;
  bool is_fullscreen = false;
  bool show_hide_toolbar = false;
  bool forward_10 = false;
  bool mute=false;
  bool backward_10 = false;



  late VideoPlayerController _controller;
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.asset("assets/demon.mp4")

      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.

        _controller.setVolume(1);

        _controller.setLooping(false);

        //!get constant data

        _controller.addListener(() {
          setState(() {
            position_second = _controller.value.position.inSeconds.toString();
            position_minute = _controller.value.position.inMinutes.toString();
            duration_second = _controller.value.duration.inSeconds.toString();
            duration_minute = _controller.value.duration.inMinutes.toString();
            duration_sec = _controller.value.duration.inSeconds.toDouble();
            duration_min = _controller.value.duration.inMinutes.toDouble();
            position_sec = _controller.value.position.inSeconds.toDouble();
            position_min = _controller.value.position.inMinutes.toDouble();
            position_milli =
                _controller.value.position.inMilliseconds.toDouble();
            position_milli =
                _controller.value.duration.inMilliseconds.toDouble();
            is_playing = _controller.value.isPlaying;
            _progress = (position_milli / duration_milli) * 100;
            is_finished = position_min * 60 + position_sec ==
                duration_min * 60 + duration_sec;
            if (is_finished) {
              forward_10 = false;
              backward_10 = false;
            }
          });
        });
      });
  }
    //!next episode / previois episode 
  void next_episode(String link){
_controller.dispose();
_controller = VideoPlayerController.asset("assets/rengoku.mp4")

      ..initialize().then((_) {
      
if(mute){
 _controller.setVolume(0);
}else{
   _controller.setVolume(1);
}
       

        _controller.setLooping(false);

        //!get constant data

        _controller.addListener(() {
          setState(() {
            position_second = _controller.value.position.inSeconds.toString();
            position_minute = _controller.value.position.inMinutes.toString();
            duration_second = _controller.value.duration.inSeconds.toString();
            duration_minute = _controller.value.duration.inMinutes.toString();
            duration_sec = _controller.value.duration.inSeconds.toDouble();
            duration_min = _controller.value.duration.inMinutes.toDouble();
            position_sec = _controller.value.position.inSeconds.toDouble();
            position_min = _controller.value.position.inMinutes.toDouble();
            position_milli =
                _controller.value.position.inMilliseconds.toDouble();
            position_milli =
                _controller.value.duration.inMilliseconds.toDouble();
            is_playing = _controller.value.isPlaying;
            _progress = (position_milli / duration_milli) * 100;
            is_finished = position_min * 60 + position_sec ==
                duration_min * 60 + duration_sec;
            if (is_finished) {
              forward_10 = false;
              backward_10 = false;
            }
          });
        });
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        Stack(children: [
          Stack(
            children: [
              Container(
                height: is_fullscreen ? screenHeight(context) : screenHeight(context)/10*2.7,
                width: is_fullscreen ? screenWidth(context) : screenWidth(context),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (show_hide_toolbar) {
                                setState(() {
                                  show_hide_toolbar = false;
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.immersive);
                                });
                              } else {
                                setState(() {
                                  show_hide_toolbar = true;
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.immersive);
                                });
                              }
                            },


                            //! video controller 


                            child: VideoPlayer(_controller)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (show_hide_toolbar) {
                                    setState(() {
                                      show_hide_toolbar = false;
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.immersive);
                                    });
                                  } else {
                                    setState(() {
                                      show_hide_toolbar = true;
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.immersive);
                                    });
                                  }
                                },
                                //! rewind 10 seconds on double tap
                                onDoubleTap: () {
                                  if(!is_finished){
                                           setState(() {
                                    position_milli =
                                        position_min * 60 + position_sec - 10;
                                    _controller.seekTo(Duration(
                                        seconds:
                                            (position_min * 60 + position_sec)
                                                    .toInt() -
                                                10));
                                    backward_10 = true;
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      backward_10 = false;
                                    });
                                  });
                                  }
                           
                                },
                                child: Container(
                                    color: Colors.transparent,
                                    width:
                                        screenWidth(context, dividedBy: 10) * 2,height: screenHeight(context, dividedBy: 10) *
                                        1.65,
                                    child:
                                    is_finished ?

                                  //! skip to previous episode 

                                    Visibility(
                                        visible: is_finished,
                                        child:  IconButton(
                                            onPressed: () {
setState(() {
   next_episode("fjf");
});
                                             
                                            },
                                            icon: Icon(
                                              Icons.skip_previous,
                                              color: Colors.white,
                                              size: 40,
                                            )))
                                    
                                    :
                                     Visibility(
                                        visible: backward_10,
                                        child:  IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.fast_rewind,
                                              color: Colors.white,
                                              size: 40,
                                            ))))),
                            Center(
                                child: is_playing
                                    ? Visibility(
                                        visible: is_playing && !show_hide_toolbar,
                                        child: IconButton(
                                          icon:
                                              Icon(Icons.pause_circle, size: 50),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              _controller.pause();
                                              is_playing = false;
                                            });
                                          },
                                        ),
                                      )
                                    : is_finished
                                        ? IconButton(
                                            icon: Icon(Icons.replay, size: 40),
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                _controller.play();
                                                is_playing = true;
                                              });
                                            },
                                          )
                                        : IconButton(
                                            icon:
                                                Icon(Icons.play_circle, size: 50),
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                _controller.play();
                                                is_playing = true;
                                              });
                                            },
                                          )),
                            GestureDetector(
                              onTap: () {
                                if (show_hide_toolbar) {
                                  setState(() {
                                    show_hide_toolbar = false;
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.immersive);
                                  });
                                } else {
                                  setState(() {
                                    show_hide_toolbar = true;
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.immersive);
                                  });
                                }
                              },

                              //! skip 10 seconds 


                              onDoubleTap: () {
                                if (!is_finished){
                                       setState(() {
                                  position_milli =
                                      position_min * 60 + position_sec + 10;
                                  _controller.seekTo(Duration(
                                      seconds: (position_min * 60 + position_sec)
                                              .toInt() +
                                          10));
                                  forward_10 = true;
                                  Future.delayed(const Duration(seconds: 1), () {
                                    forward_10 = false;
                                  });
                                });
                                }
                           
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  width: screenWidth(context, dividedBy: 10) * 2,
                                  height:
                                      screenHeight(context, dividedBy: 10) * 1.65,
                                  child: is_finished ?

                                  //! skip to next episode 


                             Visibility(
                                      visible: is_finished,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              next_episode("jfhjfhf");
                                            });
                                              
                                          },
                                          icon: Icon(
                                            Icons.skip_next,
                                            color: Colors.white,
                                            size: 40,
                                          )))

                                  
                                  : Visibility(
                                      visible: forward_10,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.fast_forward,
                                            color: Colors.white,
                                            size: 40,
                                          )))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: !is_fullscreen
                    ? screenHeight(context, dividedBy: 10) * 0.04
                    : screenHeight(context, dividedBy: 10) * 0.5,
              ),


              //!appbar Section 


              Visibility(
                visible:
                    is_fullscreen ? is_playing && !show_hide_toolbar : true,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {

            
                if(is_fullscreen){

    SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitDown,
                              DeviceOrientation.portraitUp,
                            ]);
                            setState(() {
                              is_fullscreen = false;
                            });

                            }else{
                              Navigator.pop(context);
                            }
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
                    Text(
                      "Demon Slayer|Season1|Episode1",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.tv, color: Colors.white)),
                  ],
                ),
              ),


            //!toolbar section



              SizedBox(
                  height: !is_fullscreen
                      ? screenHeight(context, dividedBy: 10) * 1.45
                      : screenHeight(context, dividedBy: 10) * 6.5),
              Visibility(
                visible: is_playing && !show_hide_toolbar,
                child: Container(
                  width: (screenWidth(context) / 10) * 9.2,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: screenWidth(context)/100,
                    ),
                    Text("${position_minute}:${position_sec.toInt()}",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Container(
                      width: !is_fullscreen
                          ? screenWidth(context, dividedBy: 10) * 3.1
                          : screenWidth(context, dividedBy: 10) * 6.2,
                      child: SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 3,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 6.0),
                        ),
                        child: Slider.adaptive(
                            value: position_min * 60 + position_sec,
                            min: 0,
                            max: duration_sec + duration_min * 60,
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            label:
                                "${position_min.toInt()}:${position_sec.toInt()}",
                            divisions:
                                (duration_min * 60 + duration_sec).toInt(),
                            onChangeStart: (value) {
                              // _controller.pause();
                            },
                            onChangeEnd: (value) {
                              _controller
                                  .seekTo(Duration(seconds: value.toInt()));
                              _controller.play();
                            },
                            onChanged: (value) {
                              setState(() {
                                position_milli = value;
                                _controller
                                    .seekTo(Duration(seconds: value.toInt()));
                              });
                            }),
                      ),
                    ),
                    Text("${duration_minute}:${duration_sec.toInt()}",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {
                              //!mute sounds 
                          if(mute){
                            _controller.setVolume(1);
                            mute=false;
                          }else{
                            _controller.setVolume(0);
                            mute=true;
                          }
                        },
                        icon: Icon(
                          mute ?
                          Icons.speaker_phone : Icons.space_bar,
                          color: Colors.white,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.subtitles,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (MediaQuery.of(context).orientation ==
                              Orientation.portrait) {
                            //if Orientation is portrait then set to landscape mode
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeLeft,
                              DeviceOrientation.landscapeRight,
                            ]);
                            setState(() {
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.immersive);
                              is_fullscreen = true;
                            });
                          } else {
                            //if Orientation is landscape then set to portrait
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitDown,
                              DeviceOrientation.portraitUp,
                            ]);
                            setState(() {
                              is_fullscreen = false;
                            });
                          }
                        },
                        icon: Icon(
                          !is_fullscreen
                              ? Icons.fullscreen
                              : Icons.fullscreen_exit,
                          color: Colors.white,
                        )),
                  ]),
                ),
              ),
            ],
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Demon Slayer : Kimletsu no",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Yaiba Entertainment",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "District Arc",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),

        //!episodes section :
        Align(
            alignment: FractionalOffset.bottomLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text("Episodes ",
                    style: GoogleFonts.arimo(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Text("",
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


        Container(
          height: 437.5,
          child: AnimationList(
            children: [
              video_screen_controller(
                url: '',
                title: '',
                id: '',
              ),
              video_screen_controller(
                url: '',
                title: '',
                id: '',
              ),
              video_screen_controller(
                url: '',
                title: '',
                id: '',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
