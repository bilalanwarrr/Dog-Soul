import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future<QuerySnapshot> fetchDocuments(coll, String header) async {
    return header == "base" ? 
    await FirebaseFirestore.instance.collection(coll).orderBy('uid', descending: false).limit(4).get(): 
    await FirebaseFirestore.instance.collection(coll).orderBy('uid', descending: false).get();
  }
}
