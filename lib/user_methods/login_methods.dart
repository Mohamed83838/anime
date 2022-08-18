import 'dart:convert';

import 'package:chat_fraj/models/user_model.dart';
import 'package:chat_fraj/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class login_methods {

  Future<String> Signup_user(
      {required String name,
      required String email,
      required String password}) async {
    Response response;
    var dio = Dio();
    response = await dio.post('http://192.168.1.199:3000/user/signup',
        data: {'name': name, 'email': email, "password": password});

    String data = '${response}';

    String res = "";
    final decoded = jsonDecode(data);
    if (decoded["status"] == "FAILED") {
      res = decoded["message"];
    } else {
      res = "SUCCESS";
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
  await prefs.setBool('islogged', true);
    }

    return res;
  }

  Future<String> signin_user(
      {required String email, required String password}) async {
    Response response;
    var dio = Dio();
    response = await dio.post('http://192.168.1.199:3000/user/signin',
        data: {'email': email, "password": password});

    String data = '${response}';
    String res = "";
    final decoded = jsonDecode(data);
    if (decoded["status"] == "FAILED") {
      res = decoded["message"];
    } else {
      res = "SUCCESS";
          final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setBool('islogged', true);
    }

    return res;
  }

  Future<User> get_userInfo({required String email}) async {
    Response response;
    var dio = Dio();
    response = await dio
        .post('http://192.168.1.199:3000/user/getinfo', data: {'email': email});
    String resp = '${response}';
    final decoded = jsonDecode(resp);
    String name = decoded["data"][0]["name"];
    String emaill = decoded["data"][0]["email"];
    String id = decoded["data"][0]["_id"];
    User user = User(name: name, id: id, email: emaill);
       


    return user;
  }

  Future<String> update_user(
      {required String email, required String name, required String id}) async {
    Response response;
    var dio = Dio();
    response = await dio.post('http://192.168.1.199:3000/user/updateinfo',
        data: {'email': email, "name": name, "id": id});

    String data = '${response}';
    String res = "";
    final decoded = jsonDecode(data);
    if (decoded["status"] == "FAILED") {
      res = decoded["message"];
    } else {
      res = "SUCCESS";
      final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email',);
    await prefs.setString('email', email);
    }

    return res;
  }

  Future<String> delete_user({required String id}) async {
    Response response;
    var dio = Dio();
    response = await dio
        .post('http://192.168.1.199:3000/user/deleteuser', data: {"id": id});

    String data = '${response}';
    String res = "";
    final decoded = jsonDecode(data);
    if (decoded["status"] == "FAILED") {
      res = decoded["message"];
    } else {
      res = "SUCCESS";
      final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email',);
      await prefs.remove('islogged',);
    }

    return res;
  }
}
