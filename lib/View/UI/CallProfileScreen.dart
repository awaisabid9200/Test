
import 'package:flutter/material.dart';
import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import '../Widgets/CustomButton3.dart';
import '../Widgets/CustomHomeImages.dart';
import '../Widgets/CustomHomeText.dart';

class CallProfile extends StatefulWidget {
  const CallProfile({super.key});

  @override
  State<CallProfile> createState() => _ProfileCallState();
}

class _ProfileCallState extends State<CallProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffECE7FF),
                    Color(0xffECE7FF),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomImage(
                        image: 'assets/icons/back.png',
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 50),
                          child: HomePageText(
                              text: 'Profile',
                              fontSize: 16,
                              textColor: AppColors.LandSColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomCircularImage(
                      image: 'assets/images/dummyprofile.jpg',
                      size: 96,
                      borderColor: AppColors.inputBorder,
                      borderWidth: 1),
                  SizedBox(
                    height: 15,
                  ),
                  HomePageText(
                      text: 'Dr. Ingredia Nutrisha',
                      fontSize: 14,
                      textColor: AppColors.inputBorder,
                      fontWeight: FontWeight.w400),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.navcolor),
                        child: Icon(Icons.message_outlined,
                            size: 20, color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.navcolor),
                        child: Icon(Icons.video_camera_back_outlined,
                            size: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             Positioned(
               bottom: 0,
               left: 0,
               right: 0,
               child: Container(
                    height: MediaQuery.sizeOf(context).height*0.55,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Colors.white),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.homeback,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HomePageText(
                              text: 'Biography',
                              fontSize: 16,
                              textColor: AppColors.inputBorder,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: 10,
                          ),
                          HomePageText(
                              text:
                                  'Dr. Ingredia gynecologist nutrish accumsan vestibulum\nTurpis tempus aliquet vitae in diam sed eget varius dui\n quisque ligula vitae sem congue feugiat.',
                              fontSize: 14,
                              textColor: AppColors.labelColor,
                              fontWeight: FontWeight.w300),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomePageText(
                                  text: 'Reviews',
                                  fontSize: 16,
                                  textColor: AppColors.inputBorder,
                                  fontWeight: FontWeight.w500),
                              HomePageText(
                                  text: 'See All',
                                  fontSize: 12,
                                  textColor: AppColors.inputBorder,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // --- horizontal Screen --- //
                          Stack(
                            children: [
                              Container(
                                height: 153,
                                width: 277,
                                margin:
                                    EdgeInsets.only(top: 40, left: 5, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 13.0, // soften the shadow
                                      spreadRadius: 0.0, //extend the shadow
                                      offset: Offset(
                                        0, // Move to right 5  horizontally
                                        3.0, // Move to bottom 5 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 20),
                                      child: HomePageText(
                                          text: 'Joke Weary',
                                          fontSize: 14,
                                          textColor: AppColors.inputBorder,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    HomePageText(
                                        text: '3 day Ago',
                                        fontSize: 12,
                                        textColor: AppColors.labelColor,
                                        fontWeight: FontWeight.w400),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(left: 10, top: 20),
                                      child: HomePageText(
                                          text:
                                              "Gynecologist made a doctor's and\nappointment, it was very nice, good\nattention, sure solution.",
                                          fontSize: 14,
                                          textColor: AppColors.labelColor,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  left: 15,
                                  bottom: 120,
                                  child: CustomCircularImage(
                                    image: 'assets/images/dummyprofile.jpg',
                                    size: 70,
                                    borderColor: AppColors.labelColor,
                                    borderWidth: 0,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(360),
                                  color: AppColors.navcolor
                                ),
                                child: Icon(Icons.location_on_outlined,size: 16,color: Colors.white,),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HomePageText(text: 'Medical Center', fontSize: 14, textColor: AppColors.inputBorder, fontWeight: FontWeight.w500),
                                  SizedBox(height: 10,),
                                  HomePageText(text: '3453 street 20 no Albama, USA', fontSize: 12, textColor: AppColors.labelColor, fontWeight: FontWeight.w400),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomePageText(text: "\$150", fontSize:24 , textColor: AppColors.LandSColor, fontWeight: FontWeight.w400),
                              CustomButton3(text:'Book Appoinment' ,onPressed: (){},)
                            ],
                          ),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ),
             ),
          ],
        ),
      ),
    );
  }
}
