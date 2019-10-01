import 'package:flutter/material.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emalta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricoes.dart';

/*
 * 
 * 
 * Dart Packages
 * https://pub.dev/
 * 
 * 
 * 
 */

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  List _telas = [
    TelaInicio(),
    TelaEmAlta(),
    TelaInscricoes(),
    TelaBiblioteca(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset("images/youtube.png",
          width: 98,
          height: 22,
        ),

        // Botões do appBar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("Videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("Account");
            },
          ),
        ],
      ),

      // Body do Scaffold
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_currentIndex],
      ),

      // bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          print(i);
          setState(() {
            _currentIndex = i;
          });
        },
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.red, // Somente se o type = BottomNavigationBarType.shifting
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder)
          )
        ],
      ),
    );
  }
}