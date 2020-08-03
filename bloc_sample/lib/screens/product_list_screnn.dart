import 'dart:js';

import 'package:blocsample/blocs/cart_bloc.dart';
import 'package:blocsample/blocs/product_bloc.dart';
import 'package:blocsample/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, "/cart"),
          ),
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: producBloc.getAll(),
      stream: producBloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? buildProductListItems(snapshot)
            : Center(
                child: Text("Data Yok"),
              );
      },
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartBloc.removeFromCart(Cart[index]);
              },
            ),
          );
        });
  }
}
