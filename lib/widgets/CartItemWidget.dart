// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:my_project/cart_controller.dart';
//
// class CartItemWidget extends StatefulWidget {
//   const CartItemWidget({Key? key}) : super(key: key);
//
//   @override
//   State<CartItemWidget> createState() => _CartItemWidgetState();
// }
//
// class _CartItemWidgetState extends State<CartItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//           () {
//         if (cartController.loading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (cartController.cartItems.isEmpty) {
//           return Center(child: Text("No cart items found!"));
//         }
//         return Stack(
//           children: [
//             Container(),
//             Positioned.fill(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: cartController.cartItems.length,
//                 padding: EdgeInsets.all(8),
//                 itemBuilder: (context, index) => Card(
//                   elevation: 0,
//                   child: Container(
//                     height: 110,
//                     padding: const EdgeInsets.all(8.0),
//                     width: 100,
//                     margin: EdgeInsets.all(4.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 100,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(cartController
//                                     .cartItems[index]["product"]["image"])),
//                           ),
//                         ),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   cartController.cartItems[index]["product"]
//                                   ["title"],
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     cartController.cartItems[index]["product"]
//                                     ["description"],
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${cartController.cartItems[index]["product"]["price"]}",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               color: Colors.grey[200],
//                               child: Icon(Icons.remove),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(cartController.cartItems[index]
//                               ["quantity"]
//                                   .toString()),
//                             ),
//                             Container(
//                               color: Colors.grey[200],
//                               child: Icon(Icons.add),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
//
//
// // Container(
// // height: 110,
// // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
// // padding: EdgeInsets.all(10),
// // decoration: BoxDecoration(
// // color: Colors.white,
// // borderRadius: BorderRadius.circular(10),
// // ),
// // child: Row(
// // children: [
// // Radio(
// // value: "",
// // groupValue: "",
// // activeColor: Color(0xFF4C53A5),
// // onChanged: (index){},
// // ),
// // Container(
// // height: 70,
// // width: 70,
// // margin: EdgeInsets.only(right: 15),
// // child: Image.network(cartModel.cartItems[index]["product"]["image"]),
// // ),
// // Padding(
// // padding: EdgeInsets.symmetric(vertical: 10),
// // child: Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // children: [
// // Text(
// // cartModel.cartItems[index]["product"]["title"],
// // maxLines: 1,
// // overflow: TextOverflow.ellipsis,
// // style: TextStyle(
// // fontSize: 18,
// // fontWeight: FontWeight.bold,
// // color: Color(0xFF4C53A5),
// // ),
// // ),
// // Text(
// // "\$${cartModel.cartItems[index]["product"]["price"]}",
// // style: TextStyle(
// // fontSize: 16,
// // fontWeight: FontWeight.bold,
// // color: Color(0xFF4C53A5),
// // ),
// // ),
// // ],
// // ),
// // ),
// // Spacer(),
// // Padding(
// // padding: EdgeInsets.symmetric(vertical: 5),
// // child: Column(
// // crossAxisAlignment: CrossAxisAlignment.end,
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // children: [
// // Icon(
// // Icons.delete,
// // color: Colors.red,
// // ),
// // Row(
// // children: [
// // Container(
// // padding: EdgeInsets.all(4),
// // decoration: BoxDecoration(
// // color: Colors.white,
// // borderRadius: BorderRadius.circular(20),
// // boxShadow: [
// // BoxShadow(
// // color: Colors.grey.withOpacity(0.5),
// // spreadRadius: 1,
// // blurRadius: 10,
// // ),
// // ],
// // ),
// // child: Icon(CupertinoIcons.plus, size: 18,),
// // ),
// // Container(
// // margin: EdgeInsets.symmetric(horizontal: 10),
// // child: Text(
// // cartModel.cartItems[index]["quantity"].toString(),
// // style: TextStyle(
// // fontSize: 16,
// // fontWeight: FontWeight.bold,
// // color: Color(0xFF4C53A5),
// // ),
// // ),
// // ),
// // Container(
// // padding: EdgeInsets.all(4),
// // decoration: BoxDecoration(
// // color: Colors.white,
// // borderRadius: BorderRadius.circular(20),
// // boxShadow: [
// // BoxShadow(
// // color: Colors.grey.withOpacity(0.5),
// // spreadRadius: 1,
// // blurRadius: 10,
// // ),
// // ],
// // ),
// // child: Icon(CupertinoIcons.minus, size: 18,),
// // ),
// // ],
// // ),
// // ],
// // ),
// // ),
// // ],
// // ),
// // )
