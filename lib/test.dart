import 'dart:convert';

import 'package:chat_fraj/anime/anime_methods.dart';
import 'package:chat_fraj/models/anime_model.dart';
import 'package:chat_fraj/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'providers/user_provider.dart';

class list_test extends StatefulWidget {
  const list_test({Key? key}) : super(key: key);

  @override
  State<list_test> createState() => _list_testState();
}

class _list_testState extends State<list_test> {


  

  
  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
    
      body:      Container(child: Card(child:
      
      
      FutureBuilder(
        
        future: anime_methods().getall(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.data ==null){
            return Expanded(child:Text("jghujgh") ,);
          }else{

            return ListView.builder(itemCount: snapshot.data.length,itemBuilder:
            
            (context,i){
              return ListTile(
            
                title: Text(snapshot.data[i].title),
                subtitle: Text(snapshot.data[i].description),
                trailing: Image.network(snapshot.data[i].image)
              );
            }
             );
          }

        
      })
      
      ,),)
    );
  }
}

class test_2 extends StatefulWidget {
  const test_2({Key? key}) : super(key: key);

  @override
  State<test_2> createState() => _test_2State();
}

class _test_2State extends State<test_2> {
  @override
  getdata()async{
await context.read<User_Provider>().refreshanime();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
await anime_methods().add();
await  context.read<User_Provider>().refreshanime();

      },child:Icon(Icons.add)),
      body: RefreshIndicator(
        onRefresh: () async{  
          context.read<User_Provider>().refreshanime();
          showSnackBar(context, "kfkf");
        },
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: context.watch<User_Provider>().animes.length,itemBuilder:
        (context,i){
          return ListTile(
            title: Text(context.watch<User_Provider>().animes[i].title),
          );
        }, gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
             
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 0,
                
                mainAxisSpacing: 20, crossAxisCount: 2), 
         ),
      ),
    );
  }
}


