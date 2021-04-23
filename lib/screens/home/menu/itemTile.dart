import 'package:campusdineadmin/models/item.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {

  final Item item;
  ItemTile({ this.item});

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
          title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(item.recipe),
          trailing: Text('₹ ${item.rate}', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}