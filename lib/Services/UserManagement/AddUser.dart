import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  CollectionReference Users =
      FirebaseFirestore.instance.collection('EcommerceAppUsers');
  String userName = 'Set Your Name';
  String phoneNumber = 'Set Your Phone Number';
  storeNewUser(uid) {
    Users.doc(uid).set({'uid': uid,'userName':userName, 'phoneNumber':phoneNumber});
  }
}
