import 'package:hive_flutter/hive_flutter.dart';

class tododatabase {
  List todolist = [];
  final _mybox = Hive.box('mybox');
  void createInitialdata() {
    todolist = [
      ["Make tutorial", false]
    ];
  }

  void loaddata() {
    todolist = _mybox.get("TODOLIST");
  }

  void updatedatabse() {
    _mybox.put("TODOLIST", todolist);
  }
}
