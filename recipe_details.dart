import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart';

class Details extends StatelessWidget {

  final String title;
  final String ingredients;
  final String steps;
  final String imgUrl;
  final int duration;

  Details({required this.title,required this.imgUrl,required this.ingredients,required this.duration,required this.steps});

  Widget _buildContainer(Widget child){


    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: gslBlue,
          border: Border.all(
              color: gslBlue
          )
      ),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gslBGColor,
      body: NestedScrollView(
          headerSliverBuilder: (context,isScrollable){
            return <Widget>[
              SliverAppBar(
                backgroundColor: gslBlue,
                expandedHeight: 200,
                titleSpacing: 2.0,
                centerTitle: true,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(title,style: TextStyle(fontSize: 15,color: Colors.white),),
                  background: Image.network(imgUrl,fit: BoxFit.cover,),
                ),
              )
            ];
          },
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Ingredients',style: TextStyle(fontSize: 20,color: Colors.black),),
              ),
              _buildContainer(
                Text(ingredients,style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Steps',style: TextStyle(fontSize: 20,color: Colors.black),),
              ),
              Expanded(child: _buildContainer(
                  Text(steps,style: TextStyle(fontSize: 20,
                      color: Colors.black),)
              ),),

            ],
          )
      ),
    );
  }
}
















