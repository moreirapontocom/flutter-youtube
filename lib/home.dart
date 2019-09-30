import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset("images/youtube.png",
          width: 98,
          height: 22,
        ),
        // actionsIconTheme: ,
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
          )
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}