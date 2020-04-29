import 'package:kitchen_companion/model/itemType.dart';

class KitchenItem {
  String id;
  String name;
  int shelfLifeMillis;
  KitchenItemType itemType;

  KitchenItem(String id, String name, int shelfLifeMillis, KitchenItemType itemType):
    this.id = id, this.name = name, this.shelfLifeMillis = shelfLifeMillis, this.itemType = itemType;

  @override
  String toString() {
    return '''{
      id: ${this.id},
      name: ${this.name},
      shelfLifeMillis: ${this.shelfLifeMillis},
      itemType: ${itemType.toString()}
    }''';
  }
}