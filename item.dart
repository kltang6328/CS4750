import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart';
import 'package:my_first_flutter_app/list.dart';

class Item extends StatelessWidget {
  final GSL todo;
  final onItemChanged;
  final onDeleteItem;

  const Item({Key? key, required this.todo, required this.onItemChanged, required this. onDeleteItem}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onItemChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank_outlined,
          color: gslBlue,
        ),
        title: Text(
          todo.listText,
          style: TextStyle(
            fontSize: 16,
            color: gslBlack,
            decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding:EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: gslRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          )
        ),
      ),
    );
  }
}