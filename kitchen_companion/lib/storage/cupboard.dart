import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchen_companion/model/itemType.dart';

class Cupboard {
  static Cupboard _instance = null;

  Cupboard._();

  Stream<List<KitchenItemType>> registerListeners() {
    return Firestore.instance
    .collection('kitchenItemTypes')
    .snapshots()
    .map((QuerySnapshot q) {
      List<KitchenItemType> types = new List();

      for (var document in q.documents) {
        var id = document.documentID;
        var data = document.data;
        types.add(KitchenItemType(id, data['name'], data['perishable'], data['createdAt']));
      }
      return types;
    });
  }

  factory Cupboard() {
    if (_instance == null) {
      _instance = Cupboard._();
    }
    return _instance;
  }
}