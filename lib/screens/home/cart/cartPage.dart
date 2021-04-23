import 'package:campusdineadmin/models/cartItem.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/screens/home/cart/cart_list.dart';
import 'package:campusdineadmin/services/cartDB.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final UserId user = Provider.of<UserId>(context);
    return StreamProvider<List<CartItem>>.value(
      initialData: null,
      value: CartDB(user).cartItems,
      child: Scaffold(
        body: CartList(),
      ),
    );
  }
}
