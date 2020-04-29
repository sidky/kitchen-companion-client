import 'package:cloud_firestore/cloud_firestore.dart';

class KitchenItemType {
  final String id;
  final String name;
  final bool isPerishable;
  final Timestamp createdAt;

  KitchenItemType(String id, String name, bool isPerishable, Timestamp createdAt): this.id = id, this.name = name, this.isPerishable = isPerishable, this.createdAt = createdAt;

  @override
  String toString() {
    return '''{
      id: ${this.id},
      name: ${this.name},
      isPerishable: ${this.isPerishable},
      createdAt: ${this.createdAt}
    }''';
  }
}