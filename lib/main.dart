import 'package:campusdineadmin/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:campusdineadmin/screens/wrapper.dart';
import 'package:campusdineadmin/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if(_error) {
      print('Oops! No Internet');
      return Center(child: Text('Oops! No Internet'));
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      print('Loading');
      return Loading();
    }
    print('Done');
    return StreamProvider<UserId>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home:Wrapper(),
      ),
    );

  }
}
