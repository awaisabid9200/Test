import 'package:dummy_fire/View/Pages/PhoneNumber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'View/Pages/CallProfileScreen.dart';
import 'View/Pages/CreatePassword.dart';
import 'View/Pages/Emailverify.dart';
import 'View/Pages/HomePage.dart';
import 'View/Pages/LoginScreen.dart';
import 'View/Pages/RegisterScreen.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? const HomePage() : const LoginScreen(),
      initialRoute: 'RegisterScreen',
      routes: {
        'phoneauth':(context)=>PhoneVerify(),
        'login': (context) => LoginScreen(),
        'HomePage': (context) => HomePage(),
        'register': (context) => RegisterScreen(),
        'Email': (context) => CreatePassword(),
        'forgotpassword': (context) => EmailVerify(),
        'phoneNo': (context) => CallProfile(),
      },
      builder: EasyLoading.init(),
    );
  }
}


