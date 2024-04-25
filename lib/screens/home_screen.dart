import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/textField_widget.dart';
import 'package:practice_project/components/widget_component/text_widget.dart';
import 'package:practice_project/screens/splash_screen.dart';
import 'package:practice_project/drawer_screen/profile_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> shoeDetails = [
    {
      "shoeImg": AppImage.shoe01Img,
      "shoeName": "Nike Club Max",
      "shoePrice": "478.7",
    },
    {
      "shoeImg": AppImage.shoe02Img,
      "shoeName": "Nike Air Force",
      "shoePrice": "367.76",
    },
    {
      "shoeImg": AppImage.shoe03Img,
      "shoeName": "Nike Jordan",
      "shoePrice": "367.76",
    },
    {
      "shoeImg": AppImage.shoe04Img,
      "shoeName": "Nike Air Max",
      "shoePrice": "254.89",
    },
    {
      "shoeImg": AppImage.shoe05Img,
      "shoeName": "Nike Air Max",
      "shoePrice": "571.6",
    },
    {
      "shoeImg": AppImage.shoe06Img,
      "shoeName": "Nike Air Max",
      "shoePrice": "897.99",
    },
    {
      "shoeImg": AppImage.shoe07Img,
      "shoeName": "Nike Air Jordan",
      "shoePrice": "659.45",
    },
  ];

  List<String> imagesLogo = [
    AppImage.nikeLogo,
    AppImage.pumaLogo,
    AppImage.converseLogo,
    AppImage.adidasLogo,
    AppImage.underArmourLogo,
  ];

  // List<String> shoeImg = [
  //   AppImage.shoe01Img,
  //   AppImage.shoe02Img,
  //   AppImage.shoe03Img,
  //   AppImage.shoe04Img,
  //   AppImage.shoe05Img,
  //   AppImage.shoe06Img,
  //   AppImage.shoe07Img,
  // ];

  // List<String> shoeName = [
  //   "Nike Club Max",
  //   "Nike Air Force",
  //   "Nike Jordan",
  //   "Nike Air Max",
  //   "Nike Air Max",
  //   "Nike Air Max",
  //   "Nike Air Jordan",
  // ];

  // List<double> shoePrice = [
  //   478.7,
  //   367.76,
  //   367.76,
  //   254.89,
  //   571.6,
  //   897.99,
  //   659.45,
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Home Screen",
          style: TextStyle(color: AppColor.whiteColor),
        ),
        leading: IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: Image.asset(AppImage.leadIcon)),
        centerTitle: true,
        actions: <Widget>[
          const SizedBox(width: 20),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            children: [
              CircleAvatar(radius: 55, child: Image.asset("assets/images/PngItem_526033.png")),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileDrawerScreen()));
                },
                tileColor: Colors.black,
                title: const Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                tileColor: Colors.black,
                title: Text(
                  "Setting",
                  style: TextStyle(color: AppColor.whiteColor),
                ),
                trailing: Icon(Icons.settings, color: AppColor.whiteColor),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                tileColor: Colors.black,
                title: Text(
                  "Privacy & policy",
                  style: TextStyle(color: AppColor.whiteColor),
                ),
                trailing: Icon(Icons.privacy_tip_outlined, color: AppColor.whiteColor),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                tileColor: Colors.black,
                title: Text(
                  "LogOut",
                  style: TextStyle(color: AppColor.whiteColor),
                ),
                trailing: Icon(Icons.logout_outlined, color: AppColor.whiteColor),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appTextField(
              hinttxt: "Looking For Shoes...",
              prefixIcon: const Icon(Icons.search_outlined),
            ),
            Text(
              "Sports",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppin", color: AppColor.blackColor),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                itemCount: imagesLogo.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.whiteColor),
                      child: Image.asset(imagesLogo[index]),
                    ),
                  );
                },
              ),
            ),
            doubleText(text: "Popular Shoes", onTap: () {}),
            SizedBox(
              height: 180,
              width: double.infinity,
              child: ListView.builder(
                itemCount: shoeDetails.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              shoeDetails[index]["shoeImg"],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "BEST SELLER",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.mainColor),
                            ),
                            Text(
                              shoeDetails[index]["shoeName"],
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  shoeDetails[index]["shoePrice"],
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.blackColor),
                                ),
                                Icon(
                                  Icons.add,
                                  color: AppColor.mainColor,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
