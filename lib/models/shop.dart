import 'package:ecom2/models/product.dart';
import 'package:flutter/foundation.dart';

class Shop extends ChangeNotifier {
  // product for sale
List<Product> _shop = [
  Product(
      name: "Jo Jacket",
      image: 'assets/jackets/1.png',
      description: '  at its layout. The point of using. It is a long established fact that a reader will be  at its layout. The point of using',
      price: 100.00,
  ),
  Product(
      name: "Clor Jacket",
      image: 'assets/jackets/2.png',
      description: '  at its layout. The point of using. It is a long established fact that a reader will be  at its layout. The point of using',
      price: 120.00,
  ),
  Product(
      name: "Nike Jackets",
      image: 'assets/jackets/3.png',
      description: '  at its layout. The point of using. It is a long established fact that a reader will be  at its layout. The point of using',
      price: 400.00,
  ),
  Product(
      name: "Nij Jackets",
      image: 'assets/jackets/4.png',
      description: '  at its layout. The point of using. It is a long established fact that a reader will be  at its layout. The point of using',
      price: 100.00,
  ),
  Product(
      name: "Addi xshirt",
      image: 'assets/jackets/5.png',
      description: 'at its layout. The point of using. It is a long established fact that a reader will be  at its layout. The point of using',
      price: 630.00,

  ),
];
  // user cart
List<Product> _cart = [];
  // get product list
List<Product> get shop => _shop;
  // get user cart
List<Product> get cart => _cart;

  // add item to cart
void addToCart(Product item){
  if(!_cart.contains(item)){
    _cart.add(item);
    notifyListeners();
  }
}
  // remove item from the cart
void removeFromCart(Product item){
  if(_cart.contains(item)){
    _cart.remove(item);
    notifyListeners();
  }
}
}