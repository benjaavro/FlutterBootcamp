import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/form_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              FormInput(
                onChange: (value) {
                  email = value;
                },
                obscure: false,
                keyboard: TextInputType.emailAddress,
                enabledBorderColor: Colors.blueAccent,
                focusedBorderColor: Colors.blueAccent,
                placeholder: 'contact@mail.com',
              ),
              SizedBox(
                height: 8.0,
              ),
              FormInput(
                onChange: (value) {
                  password = value;
                },
                obscure: true,
                enabledBorderColor: Colors.blueAccent,
                focusedBorderColor: Colors.blueAccent,
                placeholder: '*** password ***',
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPress: () async {
                  //Navigator.pop(context);
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);

                    setState(() {
                      showSpinner = false;
                    });

                    if(user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    } else {
                      // Show a modal with the e from catch
                    }
                  } catch(e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
