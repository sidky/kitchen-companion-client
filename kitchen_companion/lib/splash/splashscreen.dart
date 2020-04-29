import 'package:flutter/material.dart';
import 'package:kitchen_companion/login/login.dart';
import 'package:kitchen_companion/shopping/shoppinglist.dart';
import 'package:kitchen_companion/util/auth.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _updateAuthState(context);
    return Scaffold(
      body: Center(
        child: Text("Kitchen")
      ),
    );
  }

  void _updateAuthState(BuildContext context) async {
    new AuthUtil().isLoggedIn().then((loggedIn) {
      if (!loggedIn) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingListScreen()));
      }
    });
  }
}