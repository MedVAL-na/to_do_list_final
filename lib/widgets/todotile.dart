import 'package:flutter/material.dart';
import 'package:to_do_list_final/customColors/customColors.dart';

import '../data/tododata.dart';

class ToDoTile extends StatelessWidget {

  final ToDo item;
  final tappedOnTask;
  final tappedonDel;

  const ToDoTile ({
    Key? key,
    required this.item,
    required this.tappedonDel,
    required this.tappedOnTask
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(5),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        tileColor: item.isDone? tdaddpan: tdTiledef,
        onTap: () => {
          // print("click"),
          tappedOnTask(item),
        },
        leading:
         Icon(
             item.isDone? Icons.check_box: Icons.check_box_outline_blank,
             color: tdText
         ),
        title: Text(
          item.toDoText!,
          style:
            TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: tdText,
                decoration: item.isDone? TextDecoration.lineThrough: null,
            ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(2),
          width: 35, height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            padding: EdgeInsets.all(2),
              onPressed: ()=>{
              // print("click on del"),
                tappedonDel(item.id),
              },
              icon: Icon(Icons.delete),
              iconSize: 25,
              color: tdText,
              ),
        ),
      ),
    );
  }
}
