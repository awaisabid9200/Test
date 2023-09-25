import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_fire/View/UI/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

signUpUser
    (String userName,
    String userEmail,
    String userPhone,
    String userPassword,
    String userCPassword,) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
      "Name": userName,
      "Phone": userPhone,
      "Email": userEmail,
      "createdAt": DateTime.now(),
      "userID": userid.uid,
    }).then((value) =>{
      FirebaseAuth.instance.signOut(),
      Get.to(()=>LoginScreen()),
    });
  } on FirebaseAuthException catch (e) {
    print('error$e');
  }
}