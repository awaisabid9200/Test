// ----- This is firebase LoginScreen With in Button work ----- //

// CustomButtonIcon(
//   text: 'Login',
//   onPressed: () async {
//     if (isLoggingIn) {
//       // Don't proceed if the login process is already in progress.
//       return;
//     }
//     setState(() {
//       isLoggingIn = true;
//     });
//     var loginEmail = emailtextController.text.trim();
//     var loginPassword = passwordtextController.text.trim();
//     try {
//       final User? firebaseUser = (await FirebaseAuth.instance
//               .signInWithEmailAndPassword(
//                   email: loginEmail, password: loginPassword))
//           .user;
//       if (firebaseUser != null) {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return SizedBox(
//               height: 100,
//               width: 200,
//               child: AlertDialog(
//                 content: Row(
//                   children: [
//                     CircularProgressIndicator(),
//                     SizedBox(width: 20,),
//                     Text('Loading...',style: TextStyle(color: AppColors.inputBorder),)
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//         Future.delayed(Duration(seconds: 2), () {
//           Navigator.of(context).pop(); // Close the AlertDialog
//           Get.to(() => HomePage());
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Check email and password'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       // Display an error Snackbar.
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: $e'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     } finally {
//       setState(() {
//         isLoggingIn = false;
//       });
//     }
//   },
//   image: 'assets/icons/Login.png',
// ),


// ----- This is firebase RegisterScreen With in Button onPresswd work ----- //

//async {
// var userName = usernametextController.text.trim();
// var userPhone = phonetextController.text.trim();
// var userEmail = emailtextController.text.trim();
// var userPassword = passwordtextController.text.trim();
// var userCPassword =
//     confirmpasswordtextController.text.trim();
//
// await FirebaseAuth.instance
//     .createUserWithEmailAndPassword(
//         email: userEmail, password: userPassword)
//
//     .then((value) => {
//           log("user create"),
//           signUpUser(userName, userEmail, userPhone,
//               userPassword, userCPassword),
//           print('user create'),
//
//         });
//}

// email verification //

// // Form is valid, proceed with the action
// var forgotEmail = emailtextController.text.trim();
// try {
//   FirebaseAuth.instance
//       .sendPasswordResetEmail(email: forgotEmail)
//       .then((value) {
//     Get.off(() => const LoginScreen());
//     Get.snackbar('Email', 'Sent Check', backgroundColor: Colors.grey.shade200);
//   });
// } on FirebaseAuthException catch (e) {
//   print('error $e');
// }