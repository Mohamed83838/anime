import 'package:chat_fraj/screens/Signup/signup_screen.dart';
import 'package:chat_fraj/size.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../user_methods/login_methods.dart';
import '../../utils/utils.dart';
import '../navbar_screen.dart';



class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screen();
}

class _login_screen extends State<login_screen> {
    islogged()async{

      final prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('islogged');
 if(repeat==true){
  Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
           
 }
  }
@override

void initState() {
    // TODO: implement initState
    super.initState();

islogged();
  }



     TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

 
  @override
  void dispose() {
   
    super.dispose();
    _email.dispose();
    _password.dispose();

  }

   void signin()async{
  if (_email.text.isNotEmpty || _password.text.isNotEmpty ) {
                  String res = await login_methods().signin_user(
                      email: _email.text, password: _password.text);
                      showSnackBar(context, res);
                      if(res=="SUCCESS"){
     Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
                      }



                }else{
                  showSnackBar(context, "all fields required");
                }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Welcome back',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                    SizedBox(height: screenHeight(context)/10*2,),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text('Forgot Password',),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                      signin();
                      },
                    )
                ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                                   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => signup_screen()),
            );
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )),
      ),
    );
  }
}