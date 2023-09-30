import 'package:dummy_fire/View/Pages/HomePage.dart';
import 'package:dummy_fire/View/Pages/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Pages/CallProfileScreen.dart';
import '../Pages/EditProfile.dart';
import '../Pages/ProfileScreen.dart';
class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);
  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}
class _DrawerMenuState extends State<DrawerMenu> {
  int selectedItemIndex = -1;
  void _handleItemTap(int index) {
    setState(() {
      selectedItemIndex = index; // Set the selected item index
    });
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
      case 1:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
        break;
      case 2:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CallProfile()));
        break;
      case 3:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 4:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 5:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 6:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 7:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 8:
      // Navigate to 'Insights' screen
      // Replace 'InsightsScreen' with the actual screen you want to navigate to
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
    // Add cases for other menu items and corresponding screens
      case 9:
      // Sign Out
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      default:
        break;
    }
  }
  List icons_data = [
    Icons.person,
    Icons.star_border,
    Icons.woman_outlined,
    Icons.calendar_month,
    Icons.person_add_alt_outlined,
    Icons.payments_sharp,
    Icons.location_on,
    Icons.chat,
    Icons.notifications_none_outlined,
    Icons.settings
  ];
  List text_data = [
    'My Profile',
    'Insights',
    'My Journal',
    'Appointments',
    'Invite Friends',
    'My Payment',
    'My tracker',
    'Chat',
    'Notification',
    'Settings'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xffb0a5e5),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: ListTile(
                title: const Text(
                  'Lucy Martin',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  'lucymartin@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0x67e0d6fd),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 18)
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: text_data.length,
                        itemBuilder: (context, index) {
                          final list_text = text_data[index];
                          final list_icon = icons_data[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () => _handleItemTap(index),
                            title: Container(
                              padding: const EdgeInsets.only(left: 20),
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                color: selectedItemIndex == index
                                    ? Colors.white
                                    : const Color(0xffb0a5e5),
                                borderRadius: selectedItemIndex == index
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30))
                                    : BorderRadius.circular(0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: selectedItemIndex == index
                                          ? const Color(0xffEF6844)
                                          : const Color(0x67e0d6fd),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      list_icon,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${list_text} ',
                                    style: selectedItemIndex == index
                                        ? const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)
                                        : const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  InkWell(
                    onTap: (){
                      _showLogoutConfirmationDialog(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 70, left: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: const Color(0xffEF6844),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black45, blurRadius: 20)
                                ]),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Dismiss the dialog

                // Show loading indicator
                EasyLoading.show(status: 'Logging out...');

                // Perform the logout operation
                try {
                  await FirebaseAuth.instance.signOut();
                  // Navigate to the login screen or perform any other action
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                } catch (e) {
                  // Handle any errors that may occur during logout
                  print('Error logging out: $e');
                } finally {
                  // Dismiss the loading indicator when done
                  EasyLoading.dismiss();
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
  }
