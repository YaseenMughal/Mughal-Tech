import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/components/widget_component/textField_widget.dart';
import 'package:practice_project/components/widget_component/text_widget.dart';
import 'package:practice_project/components/widget_component/utils_widget.dart';
import 'package:practice_project/screens/favourite_screen.dart';
import 'package:practice_project/screens/login_screen.dart';
import 'package:practice_project/screens/shoe_detail_screen.dart';
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
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Image.asset(AppImage.leadIcon),
          ),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
          child: Column(
            children: [
              CircleAvatar(radius: 55, child: Image.asset("assets/images/PngItem_526033.png")),
              const SizedBox(
                height: 40,
              ),
              drawerTile(
                  title: "Profile",
                  icon: Icons.person_outline,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileDrawerScreen()));
                  }),
              drawerTile(title: "Setting", icon: Icons.settings_outlined, onTap: () {}),
              drawerTile(title: "Privacy & Policy", icon: Icons.privacy_tip_outlined, onTap: () {}),
              drawerTile(
                  title: "LogOut",
                  icon: Icons.logout_outlined,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                  }),
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
              height: 195,
              width: double.infinity,
              child: ListView.builder(
                itemCount: shoeDetails.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShoeDetail(
                                  image: shoeDetails[index]["shoeImg"],
                                  name: shoeDetails[index]["shoeName"],
                                  price: shoeDetails[index]["shoePrice"],
                                )));
                      },
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 5.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                shoeDetails[index]["shoeImg"],
                              ),
                              // const SizedBox(height: 8.0),
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
                                  InkWell(
                                    onTap: () {
                                      // Create a map containing the shoe details
                                      Map<String, String> shoeData = {
                                        'shoeImage': shoeDetails[index]['shoeImg'],
                                        'shoeName': shoeDetails[index]["shoeName"],
                                        'shoePrice': shoeDetails[index]["shoePrice"],
                                      };
                                      FavouriteScreen(shoeData: shoeData);
                                      Utils.appSnackBar(context, "Data has been sent! ${shoeDetails[index]["shoeName"]}");
                                      // Pass the shoe data to the FavouriteScreen widget
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //   builder: (context) => FavouriteScreen(shoeData: shoeData),
                                      // ));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15.0)),
                                      child: Icon(Icons.add, color: AppColor.whiteColor),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FavouriteScreen(),
                  ));
                },
                child: Text("Favourite Screen"))
          ],
        ),
      ),
    );
  }

  Widget drawerTile({required String title, required IconData icon, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColor.whiteColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 1,
              offset: Offset(0, 5),
              color: Color.fromRGBO(223, 222, 222, 1),
            ),
          ],
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }
}
