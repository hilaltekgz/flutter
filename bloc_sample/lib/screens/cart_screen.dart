import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Sepet")
      ),
      body: StreamBuilder(
        stream: cartBloc.getCart(),
        initialData: cartBloc.getCart(),
        builder: (context,snapshot){
          return buildCart(snapshot);
        },
      ),

    );
  }

  Widget buildCart(AsyncSnapshot snapshot){
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (){
        final cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].product.name),
          subtitle: Text(cart[index].product.price.toString()),

        );

      });
  }
}