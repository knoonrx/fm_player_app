import 'package:flutter/material.dart';
import 'dart:async';

import 'package:just_audio/just_audio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static String url = "http://9.fm5.com.br:8040/;stream.mp3";
  final player = AudioPlayer();
  var duration;

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    duration = await player.setUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        appBar:  AppBar(
          title: const Text('Audio Player Android iOS'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Radio 98 FM'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
            FlatButton(
              child: Icon(Icons.play_circle_filled),
              onPressed: () async {
                await player.play();
              },
            ),
            FlatButton(
              child: Icon(Icons.pause_circle_filled),
              onPressed: () async => await player.pause(),
            ),
            FlatButton(
              child: Icon(Icons.stop),
              onPressed: () async => await player.stop(),
            )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
