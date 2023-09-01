import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/dialoge_box.dart';
import 'package:to_do_app/todo_tile.dart';
import 'package:to_do_app/todobatabase.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _mybox = Hive.box('mybox');
  final _controller = TextEditingController();

  tododatabase db = tododatabase();
  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  void checkboxchanger(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedatabse();
  }

  void shownewtext() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialogbox(
          controller: _controller,
          onsave: shownewtext,
          oncancle: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedatabse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade100,
        title: Center(
            child: Text(
          'TO DO',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        )),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        backgroundColor: Colors.tealAccent.shade100,
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return todotile(
            taskname: db.todolist[index][0],
            taskcomplete: db.todolist[index][1],
            onChanged: (value) => checkboxchanger(value, index),
            deleteiteme: (BuildContext) {
              deletetask(index);
            },
          );
        },
      ),
    );
  }
}
