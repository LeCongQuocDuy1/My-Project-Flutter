import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Cart",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(24, 132, 111, 0.8),
        ),
      ),
      leading: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "homePage");
        },
        child: Icon(
          Icons.arrow_back,
          size: 30,
          color: Color(0xFF4C53A5),
        ),
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 30,
          color: Color.fromRGBO(24, 132, 111, 0.8),
        ),
      ],
      iconTheme: IconThemeData(color: Color.fromRGBO(24, 132, 111, 0.8)),
    );
  }
}


