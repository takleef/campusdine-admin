import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:campusdineadmin/Shared/loading.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserId>(context);
    final CollectionReference canteenCollection = FirebaseFirestore.instance.collection('canteen');
    return FutureBuilder<DocumentSnapshot>(
      future: canteenCollection.doc(user.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Center(child: Text("Oops! No Internet"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Scaffold(
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('Assets/Images/CampusDine.png'),
                          radius: 80.0,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Divider(
                        height: 60.0,
                        color: Colors.lightBlueAccent,
                      ),
                      Text(
                        'Canteen',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        data['Canteen'] ?? "Error",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Text(
                        'Institute',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        data['Institute'] ?? "Error",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        data['Address'] ?? "Error",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Text(
                        'Contact',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        data['Contact'] ?? "Error",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Text(
                        'ID',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        data['Id'] ?? "Error",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        height: 60.0,
                        color: Colors.lightBlueAccent,
                      ),
                      Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
                          icon: Icon(Icons.person, color: Colors.black,),
                          label: Text('Sign Out',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () async {
                            await _auth.signOut();
                          },
                        ),
                      ),
                      SizedBox(height: 30.0,),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Loading();
      },
    );
  }
}
