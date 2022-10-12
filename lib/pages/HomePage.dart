import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:my_project/categories_controller.dart';
import '../widgets/CategoriesWidget.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/ItemWidget.dart';
import '../widgets/SearchInputWidget.dart';
import '../widgets/TitleWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoriesController categoriesController = CategoriesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            productsController.toggleGrid();
          },
          icon: Icon(Icons.filter_list, size: 30, color: Color.fromRGBO(24, 132, 111, 0.8),),
        ),
        title: Text(
          "MONO Shop",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(24, 132, 111, 0.8),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
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
          ),
        ],
      ),
      body: Obx(
              () {
            if (categoriesController.loading.value)
              return Center(child: CircularProgressIndicator());
            if (categoriesController.categories.isEmpty) {
              return Center(child: Text("No categories found"));
            }
            return Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: Column(
                children: [
                  // Search input
                  SearchInputWidget(),

                  // Title
                  TitleWidget("Categories"),

                  // Categories
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 35.0,
                    child: ListView.builder(
                        itemCount: categoriesController.categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Obx(
                                  () =>
                                  InkWell(
                                    onTap: () {
                                      categoriesController.changeCategories(
                                          index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.0),
                                        color: index ==
                                            categoriesController
                                                .currentIndex.value
                                            ? Color.fromRGBO(24, 132, 111, 0.8)
                                            : Colors.transparent,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        categoriesController.categories[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: index ==
                                              categoriesController
                                                  .currentIndex.value
                                              ? Colors.white
                                              : Color.fromRGBO(24, 132, 111, 0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                            )),
                  ),

                  // Title
                  TitleWidget("Best Selling"),

                  // Products
                  Expanded(
                    child: Obx(
                          () {
                        if (productsController.loading.value)
                          return Center(child: CircularProgressIndicator());
                        if (productsController.products.isEmpty) {
                          return Center(child: Text("No products found"));
                        }
                        if (productsController.showGrid.value)
                          return GridView.builder(
                            padding: EdgeInsets.only(top: 16),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: productsController.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0.0,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(24, 132, 111, 0.8),
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                            ),
                                            child: Text(
                                              "-25%",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.favorite_border,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "itemPage");
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: Image(
                                            height: 120,
                                            width: 120,
                                            image: NetworkImage(productsController
                                                .products[index]["image"]),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 4),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          productsController
                                              .products[index]["title"],
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(24, 132, 111, 0.8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          productsController
                                              .products[index]["description"],
                                          style: TextStyle(
                                            height: 1,
                                            fontSize: 15,
                                            color: Color.fromRGBO(24, 132, 111, 0.8),
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "\$${productsController
                                                .products[index]["price"]}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(24, 132, 111, 0.8),
                                            ),
                                          ),
                                          Icon(
                                            Icons.shopping_cart_checkout,
                                            color: Color.fromRGBO(24, 132, 111, 0.8),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        return _buildProductsList();
                      },
                    ),
                  ),
                ],
              ),
            );
          }
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: Color.fromRGBO(24, 132, 111, 0.8),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

ListView _buildProductsList() {
  return ListView.builder(
    itemCount: productsController.products.length,
    padding: EdgeInsets.only(top: 16),
    itemBuilder: (context, index) => Card(
      elevation: 0.0,
      child: Container(
        height: 120,
        padding: EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, "itemPage");
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image(
                  height: 150,
                  width: 100,
                  image: NetworkImage(productsController
                      .products[index]["image"]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsController.products[index]["title"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(24, 132, 111, 0.8),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Text(
                        productsController.products[index]["description"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color.fromRGBO(24, 132, 111, 0.8),
                        ),
                      ),
                    ),
                    Text(
                      "\$${productsController.products[index]["price"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(24, 132, 111, 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
