import 'package:campusdineadmin/Shared/loading.dart';
import 'package:campusdineadmin/models/recentItem.dart';
import 'package:campusdineadmin/screens/home/recent/recentItemTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentList extends StatefulWidget {
  @override
  _RecentListState createState() => _RecentListState();
}

class _RecentListState extends State<RecentList> {
  @override
  Widget build(BuildContext context) {
    final recentItems = Provider.of<List<RecentItem>>(context);
    if (recentItems != null && recentItems.length > 0) {
      return ListView.builder(
        itemCount: recentItems.length,
        itemBuilder: (context, index) {
          return RecentItemTile(recentItem: recentItems[index]);
        },
      );
    }

    else{
        return Loading();
    }
  }
}
