import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/screens/authenticate/authenticate.dart';
import 'package:campusdineadmin/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserId>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
