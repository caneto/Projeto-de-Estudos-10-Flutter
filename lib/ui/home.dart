import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import '../model/video.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0")
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {

            }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {

              }
          ),
        ],
      ),
      body: Container(),
    );
  }
}
