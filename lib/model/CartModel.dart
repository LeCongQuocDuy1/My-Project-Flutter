import 'package:get/get.dart';
import 'package:my_project/provider/CartProvider.dart';

class CartModel extends GetxController {
  CartProvider cartProvider = CartProvider();
  var cartItems = [];
  var loading = false.obs;
  var subtotal = 0.0.obs;

  CartController() {
    loadCartFromApi();
  }
  loadCartFromApi() async {
    loading(true);
    var productsList = await cartProvider.loadCartFromApi();

    for (var i = 0; i < productsList.length; i++) {
      var product = await cartProvider.getProductFromApi(productsList[i]["productId"]);
      subtotal(subtotal.value + product["price"] * productsList[i]["quantity"]);
      cartItems.add({"product": product, "quantity": productsList[i]["quantity"]});
    }
    loading(false);
  }
}