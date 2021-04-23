import 'package:campusdineadmin/models/recentItem.dart';
import 'package:campusdineadmin/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecentDB {
  final CollectionReference cartCollection = FirebaseFirestore.instance.collection('Canteens').doc('1RpW3rmpT1O4fSeeCDqB').collection('order');
  final UserId user;
  RecentDB(this.user);

  List<RecentItem> _itemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return RecentItem(
        name: doc.get('Name'),
        rate: doc.get('Rate'),
        date: doc.get('Date'),
      );
    }).toList();
  }

  Stream<List<RecentItem>> get recentItems{
    return cartCollection.snapshots()
        .map(_itemListFromSnapshot);
  }

}



