import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_fire/View/Pages/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signUpUser(
  String userName,
  String userEmail,
  String userPhone,
  String userPassword,
  String userCPassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
      "Name": userName,
      "Phone": userPhone,
      "Email": userEmail,
      "createdAt": DateTime.now(),
      "userID": userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.to(() => const LoginScreen()),
        });
  } on FirebaseAuthException catch (e) {
    print('error$e');
  }
}
