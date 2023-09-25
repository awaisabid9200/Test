import 'package:dummy_fire/View/Widgets/DrawerMenu.dart';
import 'package:dummy_fire/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user=FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
      // home: user!= null ? const HomePage() : const LoginScreen(),
      // initialRoute: 'RegisterScreen',
      // routes: {
      //   'login': (context)=> LoginScreen(),
      //   'register': (context)=> RegisterScreen(),
      //   'Email': (context)=>CreatePassword(),
      //   'forgotpassword': (context)=>EmailVerify(),
      //   'phoneNo': (context)=> CallProfile(),
      //},
    );
  }
}

