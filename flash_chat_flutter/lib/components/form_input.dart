import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {

  FormInput({
    this.placeholder,
    @required this.onChange,
    this.regularBorderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.obscure,
    this.keyboard,
  });

  final String placeholder;
  final Function onChange;
  final Color regularBorderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final bool obscure;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboard,
      obscureText: obscure,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blueAccent,
      ),
      onChanged: onChange,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: placeholder,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}