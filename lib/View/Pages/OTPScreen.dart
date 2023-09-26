// import '../Static/Colors.dart';
// import '../Static/ImageLogo.dart';
// import 'package:flutter/material.dart';
// import '../Static/TextStyleWidgets.dart';
// import '../Widgets/CustomverifyText.dart';
// import '../Widgets/CutomBtnText.dart';
// import '../Widgets/TextWithUnderLine.dart';
//
// class OTPScreen extends StatefulWidget {
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   List<FocusNode> _focusNodes = [];
//   List<TextEditingController> _controllers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < 4; i++) {
//       _focusNodes.add(FocusNode());
//       _controllers.add(TextEditingController());
//     }
//   }
//
//   @override
//   void dispose() {
//     for (int i = 0; i < 4; i++) {
//       _focusNodes[i].dispose();
//       _controllers[i].dispose();
//     }
//     super.dispose();
//   }
//
//   void _nextField(String value, FocusNode focusNode) {
//     if (value.length == 1) {
//       focusNode.requestFocus();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backColor,
//       body: Column(
//         children: [
//           Center(child: LogoImageContainer()),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             'Phone Verification',
//             style: AuthTextstyle.headindTextStyle,
//           ),
//           CustomTextVerify(text: 'Please Enter Your OTP Here'),
//           SizedBox(
//             height: 50,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               4,
//                   (index) =>
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       width: 50,
//                       child: TextFormField(
//                         controller: _controllers[index],
//                         focusNode: _focusNodes[index],
//                         textAlign: TextAlign.center,
//                         maxLength: 1,
//                         cursorColor: AppColors.LandSColor,
//                         keyboardType: TextInputType.number,
//                         obscureText: true,
//                         style: TextStyle(
//                           color: _focusNodes[index].hasFocus
//                               ? Colors.black
//                               : Colors.red,
//                         ),
//                         decoration: InputDecoration(
//                           counterText: '',
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: AppColors
//                                 .inputBorder),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: AppColors.LandSColor),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           if (value.isNotEmpty) {
//                             if (index < 3) {
//                               _nextField(value, _focusNodes[index + 1]);
//                             }
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           CustomButton(text: 'Verify Code', onPressed: () {}),
//           SizedBox(
//             height: 20,
//           ),
//           Text('Didn`t received any code yet?',
//               style: TextStyle(color: Color(0xff7B6F72),
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12)),
//           SizedBox(height: 15,),
//           TextUndeLine(onPressed: () {}, text: 'Re-Send Code')
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../Static/ImageLogo.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomverifyText.dart';
import '../Widgets/CutomBtnText.dart';
import '../Widgets/TextWithUnderLine.dart';
import 'HomePage.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;

  const OTPVerificationScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  List<TextEditingController> _controllers = [];
  bool verifying = false; // Track OTP verification state

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < _controllers.length - 1) {
        FocusScope.of(context).nextFocus();
      }
    }
  }

  Future<void> verifyOTP() async {
    try {
      setState(() {
        verifying = true; // Start verification, show circular progress.
      });

      final code = _controllers.map((controller) => controller.text).join();
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: code,
      );
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        // If OTP is correct, navigate to the home screen.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Show Snackbar if OTP is incorrect.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP is not valid. Please try again.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e);
      // Show Snackbar for other exceptions.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        verifying = false; // Stop verification, hide circular progress.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: LogoImageContainer()),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Phone Verification',
                      style: AuthTextstyle.headindTextStyle,
                    ),
                    CustomTextVerify(text: 'Please Enter Your OTP Here'),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < _controllers.length; i++)
                          Container(
                            width: 50,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: TextField(
                              controller: _controllers[i],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              onChanged: (value) {
                                _onTextChanged(value, i);
                              },
                              decoration: InputDecoration(
                                counterText: '',
                              ),
                              autofocus: i == 0,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(text: 'Verify Code', onPressed: () async{
                      if (!verifying) {
                        await verifyOTP();
                      }
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Didn\'t receive any code yet?',
                        style: TextStyle(color: Color(0xff7B6F72),
                            fontWeight: FontWeight.w500,
                            fontSize: 12)),
                    SizedBox(height: 15,),
                    TextUndeLine(onPressed: () {}, text: 'Re-Send Code'),
                  ],
                ),
                if (verifying) // Display circular progress when verifying.
                  AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading...'),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











//
// class OTPVerificationScreen extends StatefulWidget {
//   final String verificationId;
//   const OTPVerificationScreen({super.key, required this.verificationId});
//   @override
//   _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
// }
//
// class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
//
//   List<TextEditingController> otpControllers = List.generate(
//     6,
//         (index) => TextEditingController(),
//   );
//   bool verifying = false; // Added variable for verification state.
//   @override
//   void dispose() {
//     otpControllers.forEach((controller) => controller.dispose());
//     super.dispose();
//   }
//
//   void _onTextChanged(String value, int index) {
//     if (value.isNotEmpty) {
//       if (index < otpControllers.length - 1) {
//         FocusScope.of(context).nextFocus();
//       }
//     }
//   }
//
//   Future<void> verifyOTP() async {
//     setState(() {
//       verifying = true; // Start verification, show progress indicator.
//     });
//     try {
//       final code = otpControllers.map((controller) => controller.text).join();
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: code,
//       );
//       final UserCredential userCredential =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       if (userCredential.user != null) {
//
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       } else {
//         // Show Snackbar if OTP is incorrect.
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('OTP is not valid. Please try again.'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     } catch (e) {
//       print(e);
//       // Show Snackbar for other exceptions.
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('An error occurred. Please try again later.'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     } finally {
//       setState(() {
//         verifying = false; // Stop verification, hide progress indicator.
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("OTP Verification"),
//         backgroundColor: Colors.cyan,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 "Enter the 6-digit OTP sent to your phone",
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   for (int i = 0; i < otpControllers.length; i++)
//                     Container(
//                       width: 50,
//                       child: TextField(
//                         controller: otpControllers[i],
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(1),
//                         ],
//                         onChanged: (value) {
//                           _onTextChanged(value, i);
//                         },
//                         decoration: InputDecoration(
//                           counterText: '',
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.cyan,
//                             ),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         autofocus: i == 0,
//                       ),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: verifying ? null : verifyOTP,
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.cyan,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ), // Disable button during verification.
//                 child: verifying
//                     ? const CircularProgressIndicator()
//                     : const Text("Verify OTP"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
