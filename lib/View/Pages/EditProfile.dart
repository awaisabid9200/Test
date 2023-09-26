import '../Static/Colors.dart';
import '../Static/TextStyleWidgets.dart';
import 'package:flutter/material.dart';
import '../Static/BottomNavbar.dart';
import '../Widgets/CustomTextField.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                              child: Image.asset('assets/icons/back.png')))),
                  const Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Edit Profile',
                            style: AuthTextstyle.mediumTextStyle,
                          ))),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Make the container circular
                      border: Border.all(color: AppColors.inputBorder),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/dummyprofile.jpg'),
                        // Use a default image or placeholder
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Update Picture",
                        style: AuthTextstyle.mediumTextStyle,
                      ),
                      Text(
                        'Upload a photo under 2 MB',
                        style: AuthTextstyle.smallheadindTextStyle,
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/icons/Upload.png'))
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Personal Info",
                    style: AuthTextstyle.mediumTextStyle,
                  ),
                  CustomInputField(
                      labelText: 'Lucky',
                      images: 'assets/icons/Profile.png',
                      controller: Controller),
                  CustomInputField(
                      labelText: 'Marking',
                      images: 'assets/icons/Profile.png',
                      controller: Controller),
                  CustomInputField(
                      labelText: 'Lucymarting',
                      images: 'assets/icons/Profile.png',
                      controller: Controller),
                  CustomInputField(
                      labelText: '123 456 789',
                      images: 'assets/icons/email.png',
                      controller: Controller),
                  CustomInputField(
                      labelText: 'Sangla Hill',
                      images: 'assets/icons/location.png',
                      controller: Controller),
                  CustomInputField(
                      labelText: 'Faisalabad',
                      images: 'assets/icons/location.png',
                      controller: Controller),
                  const Text(
                    "Account Info",
                    style: AuthTextstyle.mediumTextStyle,
                  ),
                  CustomInputField(
                      labelText: 'awaisabidit@gmail.com',
                      images: 'assets/icons/email.png',
                      controller: Controller),
                  CustomInputField(
                      labelText: '*******',
                      images: 'assets/icons/Profile.png',
                      controller: Controller),
                  const SizedBox(height: 30),
                  const Text(
                    'Bio',
                    style: AuthTextstyle.mediumTextStyle,
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Container(
                      height: 246,
                      width: 315,
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.inputBorder),
                      ),
                      child: const Text(
                        'Edit your bio..',
                        style:AuthTextstyle.smallheadindTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
        floatingActionButton:CustomFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar(), // Use your custom BottomAppBar
      ),
    );
  }
}