import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomverifyText.dart';
import '../Widgets/CutomBtnTextIcon2.dart';
import '../Widgets/TextWithUnderLine.dart';
import 'HomePage.dart';
import 'OTPScreen.dart';

class PhoneVerify extends StatefulWidget {
  const PhoneVerify({super.key});

  @override
  State<PhoneVerify> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<PhoneVerify> {
  TextEditingController phonetextController = TextEditingController();

  late String phoneNumber = ""; // Initialize with an empty string
  late String verificationId;
  late String authStatus = "";

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, [int? forceCodeResent]) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully sent";
        });
        // Navigate to OTPVerificationScreen here.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPVerificationScreen(
              verificationId: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: LogoImageContainer()),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Verify Phone Number',
                style: AuthTextstyle.headindTextStyle,
              ),
              CustomTextVerify(
                text: phoneNumber.isNotEmpty
                    ? 'We have sent you an SMS with a code to number\n $phoneNumber'
                    : 'Note: Please enter phone number With Country Code',
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 315,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.inputBorder),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.inputBorder),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      prefixIcon: Icon(Icons.phone_android_sharp,size: 16,color: AppColors.labelColor,),
                      hintText: 'Enter Number ',
                      hintStyle: const TextStyle(
                        color: AppColors.labelColor,
                        fontSize: 14,
                      )),
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButtonIcon2(
                text: 'Send',
                onPressed: () {
                  phoneNumber == null ? null : verifyPhoneNumber(context);
                },
              ),
              const SizedBox(height: 20.0),
              Text(
                authStatus == "" ? "" : authStatus,
                style: TextStyle(
                  color: authStatus.contains("fail") ||
                          authStatus.contains("TIMEOUT")
                      ? Colors.red
                      : Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'HomePage.dart';
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
// class _LoginPageState extends State<LoginPage> {
//   late String phoneNumber, verificationId;
//   late String authStatus = "";
//   Future<void> verifyPhoneNumber(BuildContext context) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 15),
//       verificationCompleted: (AuthCredential authCredential) {
//         setState(() {
//           authStatus = "Your account is successfully verified";
//         });
//       },
//       verificationFailed: (FirebaseAuthException authException) {
//         setState(() {
//           authStatus = "Authentication failed";
//         });
//       },
//       codeSent: (String verId, [int? forceCodeResent]) {
//         verificationId = verId;
//         setState(() {
//           authStatus = "OTP has been successfully sent";
//         });
//         // Navigate to OTPVerificationScreen here.
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => OTPVerificationScreen(
//               verificationId: verificationId,
//             ),
//           ),
//         );
//       },
//       codeAutoRetrievalTimeout: (String verId) {
//         verificationId = verId;
//         setState(() {
//           authStatus = "TIMEOUT";
//         });
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Phone Authentication"),
//         backgroundColor: Colors.cyan,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   labelText: 'Phone Number',
//                 ),
//                 onChanged: (value) {
//                   phoneNumber = value;
//                 },
//               ),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () =>
//                 // ignore: unnecessary_null_comparison
//                 phoneNumber == null ? null : verifyPhoneNumber(context),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.cyan,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text("Generate OTP"),
//               ),
//               const SizedBox(height: 20.0),
//               const Text(
//                 "Please enter the phone number followed by the country code.",
//                 style: TextStyle(color: Colors.green),
//               ),
//               const SizedBox(height: 20.0),
//               Text(
//                 authStatus == "" ? "" : authStatus,
//                 style: TextStyle(
//                   color: authStatus.contains("fail") ||
//                       authStatus.contains("TIMEOUT")
//                       ? Colors.red
//                       : Colors.green,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
