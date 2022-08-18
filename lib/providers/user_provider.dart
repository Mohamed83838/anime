import 'package:chat_fraj/anime/anime_methods.dart';
import 'package:chat_fraj/models/anime_model.dart';
import 'package:chat_fraj/user_methods/login_methods.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class User_Provider with ChangeNotifier {
  User ?_user;
 User get user => _user!;
 List<anime> ?_animes;
  List<anime> get animes=>_animes!;

 

 Future<void> refreshUser() async {
  final prefs = await SharedPreferences.getInstance();
  final String? email = prefs.getString('email');
 
    User user = await login_methods().get_userInfo(email: email==null ? "":email );
    _user = user;
    
    notifyListeners();
  }
   Future<void> refreshanime() async {
List<anime> hello=await anime_methods().getall();
_animes=hello;
    
    notifyListeners();
  }



}
