import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoProvider extends ChangeNotifier {
  // final List<String> _listItems = [];
  // List<String> get listItems => _listItems;
  final myBox = Hive.box("listItems");

  Box get getTodoList {
    // _myBox.get('listItems');
    return myBox;
  }

  void addTodo(String task) async {
    myBox.put(myBox.length, task);

    notifyListeners();
  }

  void removeTodo(int index) {
    myBox.deleteAt(index);
    // _listItems.removeAt(index);
    notifyListeners();
  }

  void editTodo(int key, String task) {
    myBox.put(key, task);
    notifyListeners();
  }
}
