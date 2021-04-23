import 'package:campusdineadmin/models/cartItem.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartDB {
  final CollectionReference cartCollection = FirebaseFirestore.instance.collection('Canteens').doc('1RpW3rmpT1O4fSeeCDqB').collection('order');
  final UserId user;
  CartDB(this.user);

  List<CartItem> _itemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return CartItem(
        name: doc.get('Name'),
        rate: doc.get('Rate'),
        date: doc.get('Date'),
        ready: doc.get('Ready'),
        receive: doc.get('Receive'),
      );
    }).toList();
  }

  Stream<List<CartItem>> get cartItems{
    return cartCollection.where('Receive', isEqualTo: false).snapshots()
    .map(_itemListFromSnapshot);
  }

}



