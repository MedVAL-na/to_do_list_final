import 'package:flutter/material.dart';
import 'package:to_do_list_final/customColors/customColors.dart';
import 'data/tododata.dart';
import 'package:to_do_list_final/widgets/todotile.dart';


void main() {
  runApp(ToDoList());
}

class ToDoList extends StatefulWidget {

  ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final toDosList = ToDo.taskList();
  final _toDocontroller = TextEditingController();
  List<ToDo>_foundToDo = [];

  @override
  void initState(){
    _foundToDo = toDosList;
    super.initState();
  }

  void _runFilter (String entered){
    List <ToDo> results = [];
    if (entered.isEmpty){
      results = toDosList;
    } else{
      results = toDosList.where((item) =>
          item.toDoText!.toLowerCase().contains(entered.toLowerCase())).toList();
    }
    setState((){
      _foundToDo = results;
    }
    );
  }

  void _changestatecheck(ToDo todo) {
    setState((){
      todo.isDone = !todo.isDone;
    }
    );
  }
  void _deleteaction(String id) {
    setState((){
      toDosList.removeWhere((item) => item.id == id);
    }
    );

  }

  void _addToDoItem(String toDo) {
    setState((){
      toDosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          toDoText: toDo
      ));
    }
    );
    _toDocontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SourceCode'),
      home: Scaffold(
        backgroundColor: tdBack,
        appBar: _buildAppbar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                            'My to-do\'s:',
                            style: TextStyle (color: tdText, fontWeight: FontWeight.bold, fontSize: 30)),
                      ),
                      for(ToDo todo in _foundToDo.reversed)
                        ToDoTile(
                          item: todo,
                          tappedOnTask: _changestatecheck,
                          tappedonDel: _deleteaction,
                        ),
                    ],

                  ),
                  ),

                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20 ,left: 20),
                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: (tdaddpan),
                      boxShadow: const [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      controller: _toDocontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon:
                        Icon(Icons.add, color: tdText, size: 20),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 32,
                          minWidth: 32,
                        ),
                        border: InputBorder.none,
                        hintText: "Add a new task" ,
                        hintStyle: TextStyle(color: tdText, fontSize: 20),
                      ),
                    ),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20 ),
                    child: FloatingActionButton(
                      backgroundColor: tdTiledef,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      onPressed: () => {
                          _addToDoItem(_toDocontroller.text),
                      },
                      child: Icon(Icons.add, color: tdText, ),
                    ),
                  ),
                ],
            ),
            ),
          ],
        ),
      ),

    );
  }
  AppBar _buildAppbar() {
    return AppBar(
      elevation: 1,
      backgroundColor: (tdTiledef),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.checklist, color: tdText),
          Text(
            'To-do List',
            style: TextStyle(
                color: tdText, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: (tdaddpan),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon:
          Icon(Icons.search_rounded, color: tdText, size: 20),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 32,
            minWidth: 32,
          ),
          border: InputBorder.none,
          hintText: "Search" ,
          hintStyle: TextStyle(color: tdText, fontSize: 20),
        ),
      ),
    );
  }

}



