import 'package:campusdineadmin/Shared/loading.dart';
import 'package:campusdineadmin/models/cartItem.dart';
import 'package:campusdineadmin/screens/home/cart/cartItemTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<List<CartItem>>(context);
    if (cartItems != null && cartItems.length > 0) {
      return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItemTile(cartItem: cartItems[index]);
        },
      );
    }
    else{
      return Loading();
    }
  }
}
