import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchen_companion/model/itemType.dart';

class KitchenItem {
  final String id;
  final String name;
  final int shelfLifeMillis;
  final KitchenItemType itemType;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  KitchenItem(String id, String name, int shelfLifeMillis, KitchenItemType itemType, Timestamp createdAt, Timestamp updatedAt):
    this.id = id, this.name = name, this.shelfLifeMillis = shelfLifeMillis, this.itemType = itemType, this.createdAt = createdAt, this.updatedAt = updatedAt;

  @override
  String toString() {
    return '''{
      id: ${this.id},
      name: ${this.name},
      shelfLifeMillis: ${this.shelfLifeMillis},
      itemType: ${itemType.toString()},
      createdAt: ${this.createdAt.toString()},
      updatedAt: ${this.updatedAt.toString()}
    }''';
  }
}