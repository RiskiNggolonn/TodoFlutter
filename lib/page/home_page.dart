import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/hivedatabase.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // load data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Menyimpan task baru
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Membuat Task baru
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

// Methods untuk logout akun
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        // Menampilkan nama email diatas appbar
        title: Text('' + user.email!),
        elevation: 0,
        actions: [
          // Icon yang didalam terdapat method Logout
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      // List view ketika task/card ditampilkan
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          // Menampilkan todotile pada home page
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
