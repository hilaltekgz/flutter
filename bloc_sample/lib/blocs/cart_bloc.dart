import 'dart:async';

import 'package:blocsample/data/cart_server.dart';
import 'package:blocsample/models/cart.dart';

class CartBloc{//block yapısında stream yapısı vardır.
  final cartStreamController = StreamController.broadcast(); //final çalışma anında değeri oluşur ve değişmez.


  Stream get getStream => cartStreamController.stream;

  void addToCart(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item){
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart(){
    return CartService.getCart();
  }
}
final cartBloc = CartBloc();