import 'package:campusdineadmin/models/cartItem.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {

  final CartItem cartItem;
  CartItemTile({ this.cartItem});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserId>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('Assets/Images/CampusDine.png'),
            backgroundColor: Colors.transparent,
          ),
          title: Text(cartItem.name, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text('\nReady:${cartItem.ready}\nReceive:${cartItem.receive}\n${cartItem.date}\n'),
          trailing: Text('₹ ${cartItem.rate}', style: TextStyle(fontWeight: FontWeight.bold),),

          onLongPress: () {
            DatabaseService().updateUserCartReadyData(cartItem.date, true);
          },
        ),
      ),
    );
  }
}
