import 'package:flutter/material.dart';
import 'package:kitchen_companion/util/auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController userTextField = new TextEditingController();
  final TextEditingController passwordTextField = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(decoration: InputDecoration(labelText: 'User name'), controller: userTextField,),
              TextField(decoration: InputDecoration(labelText: 'Password'), controller: passwordTextField, obscureText: true,),
              SizedBox(height: 10),
              OutlineButton(child: Text("Login"), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: () {
                  print("email: ${userTextField.text} password: ${passwordTextField.text}");
                  AuthUtil().signUp(userTextField.text, passwordTextField.text);
                }, 
              )
          ],
        ),
      )
      ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}