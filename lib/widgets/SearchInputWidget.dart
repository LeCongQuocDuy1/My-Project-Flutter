import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            height: 50,
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search here...",
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.camera_alt,
            size: 27,
            color: Color.fromRGBO(24, 132, 111, 0.8),
          )
        ],
      ),
    );
  }
}




