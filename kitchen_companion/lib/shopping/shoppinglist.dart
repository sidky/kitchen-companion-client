import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_companion/model/itemType.dart';
import 'package:kitchen_companion/model/kitchenItem.dart';

import '../storage/cupboard.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoppingListScreenState();
  }
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  Widget build(BuildContext context) {
    _test();
    return Scaffold(
      body: Center(child: Text("foo"),)
    );
  }

  void _test() {
    Cupboard().kitchenItems().listen((List<KitchenItem> d) {
      for (var i in d) {
        print(i);
      }
    });
  }
}