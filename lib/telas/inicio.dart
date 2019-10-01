import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube/api.dart';
import 'package:youtube/models/video.dart';

class TelaInicio extends StatefulWidget {

  String _termoPesquisa;

  // Construtor
  TelaInicio(this._termoPesquisa);

  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {

  Future<List<Video>> _pesquisaVideos(String p) {

    Api api = Api();
    return api.pesquisar( p );

  }

  @override
  Widget build(BuildContext context) {

    // int _totalVideos = 0;
    // int _maxResults = 0;

    return FutureBuilder<List<Video>>(
      future: _pesquisaVideos(widget._termoPesquisa),
      builder: (context, snapshot) {

        // Testando os stados da conexão
        switch ( snapshot.connectionState ) {
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:

            return Center(
              child: CircularProgressIndicator(),
            );

          break;
          case ConnectionState.done:
            print("Pronto!");
            if (snapshot.hasData) {

              // _totalVideos = snapshot.data['pageInfo']['totalResults'];
              // _maxResults = snapshot.data['pageInfo']['resultsPerPage'];

              return ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) => Divider(
                  height: 30,
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {

                  // Crio uma variável do tipo Lista<de vídeos> que recebe a lista de objetos Video
                  List<Video> lista = snapshot.data;

                  // Crio uma variável do tipo Video (único) que recebe cada elemento da lista
                  Video item = lista[index];

                  return GestureDetector(
                    onTap: () {

                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: API_KEY,
                        videoId: item.id,
                        autoPlay: true,
                        fullScreen: true
                      );

                    },
                    child: Column(
                      children: <Widget>[

                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(item.imagem),
                              fit: BoxFit.cover
                            ),
                          ),
                          // child: Center(
                          //   child: Icon(Icons.play_circle_filled, color: Colors.red, size: 50,)
                          // ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            title: Text( item.titulo ),
                            subtitle: Text( item.descricao ),
                          ),
                        )

                      ],
                    ),
                  );

                },
              );

            } else {

              return Center(
                child: Text('Nenhum dado a ser exibido'),
              );

            }
          break;
        }

        return Container(
          child: Text('Opa'),
        );

      },
    );

  }
}