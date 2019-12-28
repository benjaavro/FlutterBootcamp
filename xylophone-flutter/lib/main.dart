import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int n) {
    final player = AudioCache();
    player.play('note$n.wav');
  }

  Expanded newKey(Color myColor, int n) {
    return Expanded(
      child: FlatButton(
        color: myColor,
        onPressed: (){
          playSound(n);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              newKey(Colors.redAccent,1),
              newKey(Colors.orange,2),
              newKey(Colors.yellow,3),
              newKey(Colors.lightGreenAccent,4),
              newKey(Colors.green,5),
              newKey(Colors.blueAccent,6),
              newKey(Colors.deepPurpleAccent,7),
            ],
          ),
        ),
      ),
    );
  }
}