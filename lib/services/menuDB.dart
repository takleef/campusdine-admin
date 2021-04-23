import 'package:campusdineadmin/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuDB {
  final CollectionReference menuCollection = FirebaseFirestore.instance.collection('Canteens').doc('1RpW3rmpT1O4fSeeCDqB').collection('Menu');

  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Item(
        name: doc.get('Name'),
        rate: doc.get('Rate'),
        recipe: doc.get('Recipe'),
      );
    }).toList();
  }

  Stream<List<Item>> get items{
    return menuCollection.snapshots()
      .map(_itemListFromSnapshot);
  }
}
