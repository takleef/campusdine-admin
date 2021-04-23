import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  // collection reference
  final CollectionReference canteenCollection = FirebaseFirestore.instance.collection('canteen');
  final CollectionReference canteenCCollection = FirebaseFirestore.instance.collection('Canteens');
  Future<void> updateUserData(String canteen, String institute, String address, String contact, String id) async {
    return await canteenCollection.doc(uid).set({
      'Canteen': canteen,
      'Institute': institute,
      'Address': address,
      'Contact': contact,
      'Id': id,
    });
  }
  Future<void> addMenu(String name, String rate, String recipe) async {

    return await canteenCCollection.doc('1RpW3rmpT1O4fSeeCDqB').collection('Menu').doc(name).set({
      'Name': name,
      'Rate': rate,
      'Recipe': recipe,
    });
  }

  Future<void> updateUserCartReadyData(String date, bool ready) async {

    return await canteenCCollection.doc('1RpW3rmpT1O4fSeeCDqB').collection('order').doc(date).update({
      'Ready': ready,
    });
  }
}