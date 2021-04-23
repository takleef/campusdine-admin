import 'package:campusdineadmin/models/item.dart';
import 'package:campusdineadmin/screens/home/menu/menu_list.dart';
import 'package:campusdineadmin/services/database.dart';
import 'package:campusdineadmin/services/menuDB.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String name="";
  String rate="";
  String recipe="";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
      initialData: null,
      value: MenuDB().items,
      child: Scaffold(
        body: MenuList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.post_add_sharp),
          onPressed: () => setState(() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                              },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Item',
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 2.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                                  ),
                                ),
                                validator: (val) => val.isEmpty ? 'Enter Item Name' : null,
                                onChanged: (val){
                                  setState(() => name = val);
                                }
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Rate',
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 2.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                                  ),
                                ),
                                validator: (val) => val.isEmpty ? 'Enter Rate' : null,
                                onChanged: (val){
                                  setState(() => rate = val);
                                }
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Recipe',
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 2.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.greenAccent, width: 2.0)
                                  ),
                                ),
                                validator: (val) => val.isEmpty ? 'Enter Recipe' : null,
                                onChanged: (val){
                                  setState(() => recipe = val);
                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              child: Text('Add'),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  DatabaseService().addMenu(name, rate, recipe);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                 ),
                );
              });
              },
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
