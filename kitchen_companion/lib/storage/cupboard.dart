import 'package:cloud_firestore/cloud_firestore.dart';

class Cupboard {
  static Cupboard _instance = null;

  Cupboard._() {
  }

  Stream<QuerySnapshot> registerListeners() {
    return Firestore.instance
    .collection('kitchenItemTypes')
    .snapshots()
    .map((QuerySnapshot q) {
      return q;
    });
  }

  factory Cupboard() {
    if (_instance == null) {
      _instance = Cupboard._();
    }
    return _instance;
  }
}