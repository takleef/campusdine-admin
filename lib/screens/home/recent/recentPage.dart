import 'package:campusdineadmin/models/recentItem.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/screens/home/recent/recent_list.dart';
import 'package:campusdineadmin/services/recentDB.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recent extends StatefulWidget {
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    final UserId user = Provider.of<UserId>(context);
    return StreamProvider<List<RecentItem>>.value(
      initialData: null,
      value: RecentDB(user).recentItems,
      child: Scaffold(
        body: RecentList(),
      ),
    );
  }
}
