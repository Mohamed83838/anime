
import 'package:chat_fraj/screens/home_screen/home_screen.dart';
import 'package:chat_fraj/screens/profile_screen/profile_screen.dart';
import 'package:chat_fraj/screens/search_screen/search.dart';
import 'package:chat_fraj/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controlller =PageController();
  int _selectedIndex = 0;
 late VideoPlayerController _controller;
  static List<Widget> _widgetOptions = <Widget>[
    home_screen(),
    search_screen(),
    home_screen(),
    profile_screen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: Container(
        height: 60,
       decoration: BoxDecoration(
        
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)) ,), 
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,

            currentIndex: _selectedIndex, //New
            
        onTap: _onItemTapped,   
        
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
       
          items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
           
          ], ),
      ),
      
      backgroundColor:Colors.black,
      
body: _widgetOptions[_selectedIndex]
    );
  }
}