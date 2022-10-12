import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$120",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromRGBO(24, 132, 111, 0.8),
                ),
              ),
              ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(CupertinoIcons.cart_badge_plus),
                label: Text("Add To Cart", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromRGBO(24, 132, 111, 0.8)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}


