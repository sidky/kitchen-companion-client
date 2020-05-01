import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchen_companion/model/fulfilmentState.dart';
import 'package:kitchen_companion/model/kitchenItem.dart';

class ShoppingListItem {
  final String id;
  final KitchenItem item;
  final FulfilmentState fulfilmentState;
  final int value;
  final int price;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  ShoppingListItem(String id, KitchenItem item, FulfilmentState fulfilmentState, int value, int price, Timestamp createdAt, Timestamp updatedAt): 
      this.id = id, this.item = item, this.fulfilmentState = fulfilmentState, this.value = value, this.price = price, this.createdAt = createdAt, this.updatedAt = updatedAt;

  @override
  String toString() {
    return '''{
      id: ${this.id},
      item: ${this.item.toString()},
      fulfilmentState: ${this.fulfilmentState.toString()},
      value: ${this.value},
      price: ${this.price},
      createdAt: ${this.createdAt},
      updatedAt: ${this.updatedAt}
    }''';
  }
}