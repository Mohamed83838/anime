import 'dart:developer';

import 'package:chat_fraj/constants.dart';
import 'package:chat_fraj/providers/user_provider.dart';

import 'package:chat_fraj/screens/login/login_screen.dart';

import 'package:chat_fraj/screens/navbar_screen.dart';
import 'package:chat_fraj/screens/signup/signup_screen.dart';

import 'package:chat_fraj/test.dart';
import 'package:chat_fraj/utils/utils.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create:(_)=>User_Provider()),
],child:MyApp()

),
);
  
   

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
  
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  
     
      home:login_screen()
     
      ,
    );
  }
}

