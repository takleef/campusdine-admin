import 'package:campusdineadmin/screens/home/Account.dart';
import 'package:campusdineadmin/screens/home/cart/cartPage.dart';
import 'package:campusdineadmin/screens/home/menu/menuPage.dart';
import 'package:campusdineadmin/screens/home/recent/recentPage.dart';
import "package:flutter/material.dart";

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.restaurant, color: Colors.black,),),
              Tab(icon: Icon(Icons.bookmark_border, color: Colors.black,),),
              Tab(icon: Icon(Icons.history, color: Colors.black,),),
              Tab(icon: Icon(Icons.account_circle, color: Colors.black,),),
            ],
          ),
          title: Text(
            'CampusAdmin',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body:
        TabBarView(
          children: [
            Menu(),
            Cart(),
            Recent(),
            AccountPage(),
          ],
        ),
      ),
    );
  }
}