import 'dart:async';
import 'package:blocsample/data/product_service.dart';
import 'package:blocsample/models/product.dart';

class ProductBloc{
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream; //getter

  List<Product> getAll(){
    return ProductService.getAll();
  }
}

final producBloc = ProductBloc();