import 'package:campusdineadmin/services/auth.dart';
import 'package:campusdineadmin/Shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading=false;
  String email='';
  String password='';
  String cpassword='';
  String name='';
  String institute='';
  String address='';
  String contact='';
  String id='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text(
          'CampusAdmin',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 25.0,
          ),
        ),
        //centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black,),
            label: Text('Sign In  ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('Assets/Images/CampusDine.png'),
                      radius: 100.0,
                      backgroundColor: Colors.transparent,
                    ),

                    SizedBox(height:30.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                        ),
                      ),
                        validator: (val) => val.isEmpty ? 'Enter Email' : null,
                        onChanged: (val){
                          setState(() => email = val);
                        }
                    ),
                    SizedBox(height:20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                          ),
                        ),
                        obscureText: true,
                        validator: (val) => val.length<6 ? 'Password length should be greater than 6' : null,
                        onChanged: (val){
                          setState(() => password = val);
                        }
                    ),
                    SizedBox(height:30.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                          ),
                        ),
                        obscureText: true,
                        validator: (val) => val.characters != password.characters ? 'Password not matched' : null,
                        onChanged: (val){
                          setState(() => cpassword = val);
                        }
                    ),
                    SizedBox(height:30.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                          ),
                        ),
                        validator: (val) => val.isEmpty ? 'Enter Name' : null,
                        onChanged: (val){
                          setState(() => name = val);
                        }
                    ),
                    SizedBox(height:20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Institute',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                          ),
                        ),
                        validator: (val) => val.isEmpty ? 'Enter Institute Name' : null,
                        onChanged: (val){
                          setState(() => institute = val);
                        }
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Address',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                          ),
                        ),
                        validator: (val) => val.isEmpty ? 'Enter Address' : null,
                        onChanged: (val){
                          setState(() => address = val);
                        }
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Contact',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                          ),
                        ),
                        validator: (val) => val.isEmpty ? 'Enter Contact' : null,
                        onChanged: (val){
                          setState(() => contact = val);
                        }
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Identity Number',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                          ),
                        ),
                        validator: (val) => val.isEmpty ? 'Enter Identity Number' : null,
                        onChanged: (val){
                          setState(() => id = val);
                        }
                    ),
                    SizedBox(height: 20.0,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
                        child:Text(
                          'Register',
                          style: TextStyle(color:Colors.black),
                        ),
                        onPressed: () async{
                          if(_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password, name, institute, address, contact, id);

                            if (result == null){
                              setState(() {
                                error = 'Invalid Email';
                                loading = false;
                              });
                            }
                          }
                        }
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
