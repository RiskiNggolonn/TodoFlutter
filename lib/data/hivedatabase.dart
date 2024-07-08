import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // Menjalankan method ini untuk pertama kali
  void createInitialData() {
    toDoList = [
      ["Mmbuat Tutorial", true],
      ["Kerja Tugas", true],
    ];
  }

  // load data dari local database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
