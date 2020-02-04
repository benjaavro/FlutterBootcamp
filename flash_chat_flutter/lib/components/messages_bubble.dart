import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  MessageBubble({@required this.msg, @required this.sender, @required this.isMe});

  final String msg;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget> [
            Text(
              sender,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white70,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.0),
            ),
            Material(
              borderRadius: isMe ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ) : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              elevation: 5.0,
              color: isMe ? Colors.lightBlueAccent : Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  '$msg',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}