import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Item.dart';

class ItemProvider extends ChangeNotifier{
  List <Item> _items = [
    Item(name: "Tap to the button to create new items"),
  ];

  List<Item> get items=> _items;

  void addItem(String itemName){
    _items.add(Item(name: itemName));
    notifyListeners();
  }

}
