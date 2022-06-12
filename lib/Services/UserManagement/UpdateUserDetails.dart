import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserDetails {
  final String uid;
  UpdateUserDetails({required this.uid});
  CollectionReference Users =
      FirebaseFirestore.instance.collection('EcommerceAppUsers');

  updateUserName(userName) {
    Users.doc(uid).update({'userName': userName});
  }

  updateUserPhoneNumber(phoneNumber) {
    Users.doc(uid).update({'phoneNumber': phoneNumber});
  }

  updateUserAddress(address) {
    Users.doc(uid).update({'address': address});
  }
}
