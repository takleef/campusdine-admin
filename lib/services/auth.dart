import 'package:campusdineadmin/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:campusdineadmin/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user object
  UserId _userFromFirebaseUser(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }

  Stream<UserId> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //SignIn Anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword( String email, String password, String name, String institute,String address, String contact,  String id) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(name, institute, address, contact, id);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword( String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      print(user.uid);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }



  // Sign Out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}