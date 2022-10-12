import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/cart_controller.dart';
import 'package:get/get.dart';

import '../widgets/CartBottomNavBar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = CartController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            color: Color.fromRGBO(24, 132, 111, 0.8),
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
      ),
      body: Obx(
        () {
          if (cartController.loading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (cartController.cartItems.isEmpty) {
            return Center(child: Text("No cart items found!"));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cartController.cartItems.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) => Container(
              height: 240,
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.all(Radius.circular(35)),
              ),
              child: Column(
                children: [
                  Container(
                    height: 110,
                    margin: EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          value: "",
                          groupValue: "",
                          activeColor: Color.fromRGBO(24, 132, 111, 0.8),
                          onChanged: (index) {},
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(right: 15),
                          child: Image.network(
                              cartController.cartItems[index]["product"]["image"]),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120,
                                child: Text(
                                  cartController
                                      .cartItems[index]["product"]["title"],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(24, 132, 111, 0.8),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "\$${cartController
                                    .cartItems[index]["product"]["price"]}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(24, 132, 111, 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      CupertinoIcons.plus, size: 18,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      cartController.cartItems[index]["quantity"]
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(24, 132, 111, 0.8),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      CupertinoIcons.minus, size: 18,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(24, 132, 111, 0.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.add, color: Colors.white,),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Add Coupon Code",
                            style: TextStyle(
                              color: Color.fromRGBO(24, 132, 111, 0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}


