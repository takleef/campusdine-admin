import 'package:campusdineadmin/models/recentItem.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentItemTile extends StatelessWidget {

  final RecentItem recentItem;
  RecentItemTile({ this.recentItem});

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
          title: Text(recentItem.name, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(recentItem.date),
          trailing: Text('₹ ${recentItem.rate}', style: TextStyle(fontWeight: FontWeight.bold),),

          onLongPress: () {

          },
        ),
      ),
    );
  }
}
