import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchen_companion/model/fulfilmentState.dart';
import 'package:kitchen_companion/model/itemType.dart';
import 'package:kitchen_companion/model/kitchenItem.dart';
import 'package:kitchen_companion/model/shoppingListItem.dart';

class Cupboard {
  static Cupboard _instance;

  Cupboard._();

  Stream<List<KitchenItemType>> kitchenItemTypes() {
    return Firestore.instance
    .collection('kitchenItemTypes')
    .snapshots()
    .asyncMap((snapshot) {
      return snapshot.documents.map((document) => toKitchenItemType(document)).toList();
    });
  }

  Stream<List<KitchenItem>> kitchenItems() {
    return Firestore.instance
      .collection('kitchenItems')
      .snapshots()
      .asyncMap((s) async {
        return await s.documents.fold(new List<KitchenItem>(), (flist, snapshot) async {
          var list = await flist;
          var item = await toKitchenItem(snapshot);
          list.add(item);
          return list;
        });
      });
  }

  Stream<List<ShoppingListItem>> shoppingList() {
    return Firestore.instance
      .collection('shoppingList')
      .snapshots()
      .asyncMap((s) async {
        return await s.documents.fold(new List<ShoppingListItem>(), (flist, snapshot) async {
          var list = await flist;
          var item = await toShoppingListItem(snapshot);
          list.add(item);
          return list;
        });
      });
  }

  factory Cupboard() {
    if (_instance == null) {
      _instance = Cupboard._();
    }
    return _instance;
  }

  KitchenItemType toKitchenItemType(DocumentSnapshot document) {
        var id = document.documentID;
        var data = document.data;
        return KitchenItemType(id, data['name'], data['perishable'], data['createdAt']);
  }

  Future<KitchenItem> toKitchenItem(DocumentSnapshot snapshot) async {
    var id = snapshot.documentID;
    var data = snapshot.data;
    DocumentReference ref = data['type'];

    KitchenItemType type;
    if (ref != null) {
      type = toKitchenItemType(await ref.get());
    } else {
      type = null;
    }
    return KitchenItem(id, data['name'], data['shelfLifeMillis'], type, data['createdAt'], data['updatedAt']);
  }

  Future<ShoppingListItem> toShoppingListItem(DocumentSnapshot snapshot) async {
    var id = snapshot.documentID;
    var data = snapshot.data;
    DocumentReference refItem = data['item'];

    KitchenItem item;

    if (refItem != null) {
      var ki = await refItem.get();
      print(ki);
      item = await toKitchenItem(ki);
    } else {
      item = null;
    }

    return ShoppingListItem(id, item, toFulfilmentState(data['fulfilment']), data['value'], data['price'], data['createdAt'], data['updatedAt']);
  }

  FulfilmentState toFulfilmentState(int value) {
    return FulfilmentState.values[value];
  }
}