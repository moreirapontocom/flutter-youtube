import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/models/video.dart';

const String API_KEY = "AIzaSyAplrtS4QWvhygd7UJnK3Y5-bhkYHhqyi4";
const String URL_BASE = "https://www.googleapis.com/youtube/v3";
const String ID_CANAL = "UCKHhA5hN2UohhFDfNXB_cvQ"; // Manual do Mundo
// const String ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg"; // Android Developers
// const String ID_CANAL = "UC87FNdJ0-t9GEXiQbCA4G-A"; // Lucas Moreira

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {

    List<Video> videos;

    http.Response response = await http.get(
      URL_BASE + '/search'
      '?part=snippet'
      '&q=' + pesquisa +
      '&maxResults=5'
      '&type=video'
      '&order=date'
      '&channelId=' + ID_CANAL +
      '&key=' + API_KEY
    );

    if (response.statusCode==200) {
      Map<String, dynamic> dadosJson = json.decode( response.body );

      /*
      // Esta é uma forma de fazer mas não é otimizada pois, se eu tiver 100 itens,
      // Serão necessários 100 espaços na memória para alocar as 100 instâncias de Video
      for (var item in dadosJson['items'] ) {

        // Crio um objeto do tipo Video
        var v = Video(
          id: item['id']['videoId'],
          ...
        );

        // Adiciono o objeto Video à lista (List) de objetos de vídeo
        videos.add( v );
      }
      */

      // Forma otimizada (no model, utiliza-se o factory)
      // Crio uma List de objetos do tipo Video
      // O map() faz o mesmo processo de um for()
      videos = dadosJson['items'].map<Video>((item) {
        // A função map espera objetos do tipo Video e passa cada objeto (como se fosse um for()) para a variável item
        // A variável item vai pro model como um JSON e lá é convertida pra um objeto do tipo Video
        return Video.fromJson(item);
      }).toList(); // Converte a lista de objetos do tipo Video em uma lista

    }

    return videos;

  }

}