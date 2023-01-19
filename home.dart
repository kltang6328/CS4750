import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart';
import 'package:my_first_flutter_app/item.dart';
import 'package:my_first_flutter_app/list.dart';
import 'package:my_first_flutter_app/navbar.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final groceriesList = GSL.groceryList();
  List<GSL> _foundItem = [];
  final _itemController = TextEditingController();

  @override
  void initState() {
    _foundItem = groceriesList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gslBGColor,
      drawer: NavBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: gslBGColor,
        title: Text(''),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Grocery Shopping List',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (GSL todo in _foundItem)
                        Item(
                          todo: todo,
                          onItemChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _itemController,
                    decoration: InputDecoration(
                        hintText: 'Add a new item',
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text('+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addToDoItem(_itemController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gslBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(GSL todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      groceriesList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      groceriesList.add(GSL(
        id: DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(),
        listText: toDo,
      ));
    });
    _itemController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<GSL> results = [];
    if (enteredKeyword.isEmpty) {
      results = groceriesList;
    } else {
      results = groceriesList
          .where((item) =>
          item.listText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundItem = results;
    });
  }

  Widget searchBox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: gslBlack,
                size: 20,
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                minWidth: 25,
              ),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(color: gslGrey),
            )));
  }
}
