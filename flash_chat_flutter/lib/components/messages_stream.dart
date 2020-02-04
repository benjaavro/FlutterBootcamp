import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/messages_bubble.dart';

class MessagesStream extends StatelessWidget {

  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  FirebaseUser loggedUser;

  void getCurrentUser() async {
    final user = await _auth.currentUser();

    try {
      if(user != null) {
        loggedUser = user;
        print(loggedUser.email);
      }
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('date', descending: false).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];

        for(var msg in messages){
          final messageText = msg.data['text'];
          final messageSender = msg.data['sender'];

          final currentUser = loggedUser.email;

          if(currentUser == messageSender){
            // Message is from logged in user
          }

          final msgBubble = MessageBubble(
            msg: messageText,
            sender: messageSender,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(msgBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
        // ignore: missing_return
      },
    );
  }
}