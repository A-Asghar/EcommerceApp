import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  CollectionReference Users =
      FirebaseFirestore.instance.collection('EcommerceUsers');
  storeNewUser(uid) {
    Users.doc(uid).set({'uid': uid});
  }
}
