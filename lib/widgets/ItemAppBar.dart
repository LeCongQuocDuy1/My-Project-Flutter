import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "homePage");
            },
            child: Icon(Icons.arrow_back, size: 30, color: Color.fromRGBO(24, 132, 111, 0.8),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
                "Product",
                style: TextStyle(
                  color: Color.fromRGBO(24, 132, 111, 0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}



