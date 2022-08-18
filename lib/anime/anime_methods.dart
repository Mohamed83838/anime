import 'dart:convert';

import 'package:chat_fraj/models/anime_model.dart';
import 'package:dio/dio.dart';

class anime_methods{


  Future<List<anime>>getall()async{

        Response response;
        
        var dio = Dio();
        
        response = await dio.get('http://192.168.1.199:3000/anime/getall');
   
        String data = '${response}';
        final decoded = jsonDecode(data);
        var hello =decoded["data"].toList();
        List<anime> animes=[];
        for (var u in hello){
anime Anime=anime(title: u["title"], description: u["description"], image: u["image"], trailer: u["trailer"], Episode: u["Episode"]);
animes.add(Anime);
        }
        return animes;
       

  }
    Future<void>add()async{

        Response response;
        
        var dio = Dio();
        
        response = await dio.post('http://192.168.1.199:3000/anime/post');
   
      

  }
}