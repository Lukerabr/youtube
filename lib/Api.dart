import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBNBps6bSQ7QpDVjWAjYFYQkn--F8KETno";
const ID_CANAL = "UCW0gH2G-cMKAEjEkI4YhnPA";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar (String pesquisa) async {

    http.Response response = await http.get(Uri.parse(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    )
    );

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

        return videos;

      /*
      for(var video in videos){
        print("resultado: " + video.titulo.toString()); // colocar o toString pois foi iniciado o parâmetro como String?
      }
      */

      /*
      for(var video in dadosJson["items"]){
        print("Resultado: " + video.toString());
      }
      */

    }else{

    }

  }

}
