import 'package:campusdineadmin/Shared/loading.dart';
import 'package:campusdineadmin/models/item.dart';
import 'package:campusdineadmin/screens/home/menu/itemTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<Item>>(context);
    if (items != null && items.length > 0) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemTile(item: items[index]);
        },
      );
    }
    else{
      return Loading();
    }
  }
}
