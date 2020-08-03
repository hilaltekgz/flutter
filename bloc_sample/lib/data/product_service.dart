import 'package:blocsample/models/product.dart';

class ProductService{
  static List<Product> products=new List<Product>();
  static ProductService _singleton = ProductService._internal();

  factory ProductService(){
    return _singleton;
  }

  ProductService._internal();
  static List<Product> getAll(){//Singleton tasarım deseni için
    products.add(new Product(1, "Acer Laptop",6000 ));
    products.add(new Product(2, "Asus Laptop",8000 ));
    products.add(new Product(3, "Hp Laptop",4000 ));
    return products;
  }
}