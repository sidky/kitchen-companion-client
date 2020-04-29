import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchen_companion/model/itemType.dart';
import 'package:kitchen_companion/model/kitchenItem.dart';

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

    // TODO: Check ref is not null
    KitchenItemType type = toKitchenItemType(await ref.get());
    return KitchenItem(id, data['name'], data['shelfLifeMillis'], type);
  }
}