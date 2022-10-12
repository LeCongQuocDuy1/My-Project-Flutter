import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:my_project/categories_controller.dart';

class HomeAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                productsController.toggleGrid();
              },
              icon: Icon(Icons.filter_list, size: 30, color: Color.fromRGBO(24, 132, 111, 0.8),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "MONO Shop",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(24, 132, 111, 0.8),
              ),
            ),
          ),
          Spacer(),
          Badge(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "5",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "cartPage");
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Color.fromRGBO(24, 132, 111, 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




