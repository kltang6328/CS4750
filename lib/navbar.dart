import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/home.dart';
import 'package:my_first_flutter_app/choose.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 30),
        children: [
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Grocery Shopping List'),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),
                )),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Choose Your Recipe'),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Choose(),
          )),
          )],
      ),
    );
  }
}

