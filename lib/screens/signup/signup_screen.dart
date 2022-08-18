import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../user_methods/login_methods.dart';
import '../../utils/utils.dart';
import '../navbar_screen.dart';


class signup_screen extends StatefulWidget {
  const signup_screen({Key? key}) : super(key: key);

  @override
  State<signup_screen> createState() => _signup_screen();
}

class _signup_screen extends State<signup_screen> {


     TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
   TextEditingController _name = TextEditingController();
 
  @override
  void dispose() {
   
    super.dispose();
    _email.dispose();
    _password.dispose();
    _name.dispose();
  }

   void signup()async{
  if (_email.text.isNotEmpty || _password.text.isNotEmpty || _name.text.isNotEmpty) {
                  String res = await login_methods().Signup_user(
                      email: _email.text, password: _password.text, name: _name.text);
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
      body: Padding(
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
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
                 Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email ',
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
                    child: const Text('sign up'),
                    onPressed: () {
                       signup();
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
                      Navigator.pop(context);
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}