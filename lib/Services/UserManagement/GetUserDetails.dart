import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserDetails {

  String userName = '';
  String phoneNumber = '';
  String email = '';
  String address = '';
  Future<String>? getName(var user) async {
    var document = FirebaseFirestore.instance
        .collection('EcommerceAppUsers')
        .doc(user.uid);
    await document.get().then((document) {
      userName = document['userName'];
    });
    return userName;
  }

  Future<String>? getPhoneNum(var user) async {
    var document = await FirebaseFirestore.instance
        .collection('EcommerceAppUsers')
        .doc(user.uid);
    await document.get().then((document) {
      print(document['phoneNumber']);
      phoneNumber = document['phoneNumber'];
    });
    return phoneNumber;
  }

  Future<String>? getEmail(var user) async {
    var document = FirebaseFirestore.instance
        .collection('EcommerceAppUsers')
        .doc(user.uid);
    await document.get().then((document) {
      print(document['email']);
      email = document['email'];
    });
    return email;
  }

  Future<String>? getAddress(var user) async {
    var document = FirebaseFirestore.instance
        .collection('EcommerceAppUsers')
        .doc(user.uid);
    await document.get().then((document) {
      print(document['address']);
      address = document['address'];
    });
    return address;
  }
}
