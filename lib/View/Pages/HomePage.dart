import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import 'package:flutter/material.dart';
import '../../Model/HomePageModel.dart';
import '../Static/BottomNavbar.dart';
import '../Widgets/CustomHomeImages.dart';
import '../Widgets/CustomHomeText.dart';
import '../Widgets/DrawerScreen.dart';
import '../Widgets/SearchBar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the start and end
          children: [
            Row(
              children: [
                CustomCircularImage(
                  image: 'assets/images/freetrials.png',
                  size: 54,
                  borderColor: AppColors.LandSColor,
                  borderWidth: 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomePageText(
                      text: 'GoodMorning',
                      fontSize: 14,
                      textColor: AppColors.inputBorder,
                      fontWeight: FontWeight.w500,
                    ),
                    HomePageText(
                      text: 'Dr.Norma',
                      fontSize: 24,
                      textColor: AppColors.LandSColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
            Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: CustomImage(
                    image: 'assets/icons/menu.png',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      drawer: const DrawerMenu(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                const SearchWidget(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomePageText(
                        text: 'Upcoming  Consultations',
                        fontSize: 20,
                        textColor: AppColors.inputBorder,
                        fontWeight: FontWeight.w600),
                    HomePageText(
                        text: 'See all',
                        fontSize: 12,
                        textColor: AppColors.LandSColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                // ---- horizontal List ---- ///
                Container(
                  height: 194,
                  margin: const EdgeInsets.only(top: 30, bottom: 40),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 209, // Set the width of each container
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.homeback1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomCircularImage(
                                      image: itemList[index].imageUrl,
                                      size: 50,
                                      borderColor: AppColors.LandSColor,
                                      borderWidth: 2),
                                  const SizedBox(height: 5),
                                  HomePageText(
                                      text: " 5.45PM\n\n Oct 7 ",
                                      fontSize: 12,
                                      textColor: AppColors.LandSColor,
                                      fontWeight: FontWeight.w600)
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              HomePageText(
                                  text: itemList[index].text,
                                  fontSize: 20,
                                  textColor: AppColors.inputBorder,
                                  fontWeight: FontWeight.w600),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: HomePageText(
                                  text: itemList[index].text1,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColors.navcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // ----Clint Profile----- //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomePageText(
                        text: 'Client Profile',
                        fontSize: 20,
                        textColor: AppColors.inputBorder,
                        fontWeight: FontWeight.w600),
                    HomePageText(
                        text: 'See all',
                        fontSize: 12,
                        textColor: AppColors.LandSColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomCircularImage(
                            image: 'assets/images/freetrials.png',
                            size: 74,
                            borderColor: AppColors.LandSColor,
                            borderWidth: 2),
                        const SizedBox(
                          height: 10,
                        ),
                        HomePageText(
                            text: 'Jany',
                            fontSize: 14,
                            textColor: AppColors.inputBorder,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    Column(
                      children: [
                        CustomCircularImage(
                            image: 'assets/images/poert_03.png',
                            size: 74,
                            borderColor: AppColors.LandSColor,
                            borderWidth: 2),
                        const SizedBox(
                          height: 10,
                        ),
                        HomePageText(
                            text: 'Jany',
                            fontSize: 14,
                            textColor: AppColors.inputBorder,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    Column(
                      children: [
                        CustomCircularImage(
                            image: 'assets/images/poert_02.png',
                            size: 74,
                            borderColor: AppColors.LandSColor,
                            borderWidth: 2),
                        const SizedBox(
                          height: 10,
                        ),
                        HomePageText(
                            text: 'Jany',
                            fontSize: 14,
                            textColor: AppColors.inputBorder,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    Column(
                      children: [
                        CustomCircularImage(
                            image: 'assets/images/poert_01.png',
                            size: 74,
                            borderColor: AppColors.LandSColor,
                            borderWidth: 2),
                        const SizedBox(
                          height: 10,
                        ),
                        HomePageText(
                            text: 'Jany',
                            fontSize: 14,
                            textColor: AppColors.inputBorder,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        HomePageText(
                            text: 'All Sessions',
                            fontSize: 18,
                            textColor: AppColors.inputBorder,
                            fontWeight: FontWeight.w500),
                        const Icon(Icons.arrow_drop_down_sharp),
                      ],
                    ),
                    const Icon(Icons.filter_list_outlined, color: AppColors.labelColor),
                  ],
                ),
                // ---- vertical List ---- //
                Container(
                  height: 171,
                  margin: const EdgeInsets.only(top: 30, bottom: 40),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: 325, // Set the width of each container
                          margin:
                          const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedIndex == index
                                ? AppColors.homeback
                                : AppColors.box,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomCircularImage(
                                        image: itemList[index].imageUrl,
                                        size: 35,
                                        borderColor: AppColors.LandSColor,
                                        borderWidth: 1),
                                    const SizedBox(width: 20),
                                    HomePageText(
                                        text: itemList[index].text,
                                        fontSize: 14,
                                        textColor: AppColors.inputBorder,
                                        fontWeight: FontWeight.w500)
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                    thickness: 0.4, color: AppColors.labelColor),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          size: 14,
                                          color: AppColors.labelColor,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        HomePageText(
                                            text: '1st May ‘23',
                                            fontSize: 12,
                                            textColor: AppColors.inputBorder,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.lock_clock,
                                          size: 14,
                                          color: AppColors.labelColor,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        HomePageText(
                                            text: '7:30PM - 8.30PM',
                                            fontSize: 12,
                                            textColor: AppColors.inputBorder,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 117,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.LandSColor),
                                      child: HomePageText(
                                        text: 'Reschedule',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        textColor: Colors.white,
                                      ),
                                    ),
                                    HomePageText(
                                        text: itemList[index].text1,
                                        fontSize: 14,
                                        textColor: AppColors.navcolor,
                                        fontWeight: FontWeight.w700),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(), // Use your custom BottomAppBar
    );
  }
}