import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/textField_widget.dart';
import 'package:practice_project/screens/splash_screen.dart';
import 'package:practice_project/drawer_screen/profile_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagesLogo = [
    AppImage.nikeLogo,
    AppImage.pumaLogo,
    AppImage.shoe2Logo,
    AppImage.adidasLogo,
    AppImage.shoeLogo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
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
        backgroundColor: Colors.white,
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
              const ListTile(
                tileColor: Colors.black,
                title: Text(
                  "Setting",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.settings, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const ListTile(
                tileColor: Colors.black,
                title: Text(
                  "Privacy & policy",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.privacy_tip_outlined, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                tileColor: Colors.black,
                title: const Text(
                  "LogOut",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(Icons.logout_outlined, color: Colors.white),
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
            Container(
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
            )

            // Row(
            //   children: [
            // Container(
            //   height: 55,
            //   width: 55,
            //   decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.whiteColor),
            //   child: Image.asset(AppImage.nikeLogo),
            // ),
            //     const SizedBox(width: 10.0),
            //     Container(
            //       height: 55,
            //       width: 55,
            //       decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.whiteColor),
            //       child: Image.asset(AppImage.pumaLogo),
            //     ),
            //     const SizedBox(width: 10.0),
            //     Container(
            //       height: 55,
            //       width: 55,
            //       decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.whiteColor),
            //       child: Image.asset(AppImage.shoeLogo),
            //     ),
            //     const SizedBox(width: 10.0),
            //     Container(
            //       height: 55,
            //       width: 55,
            //       decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.whiteColor),
            //       child: Image.asset(AppImage.adidasLogo),
            //     ),
            //     const SizedBox(width: 10.0),
            //     Container(
            //       height: 55,
            //       width: 55,
            //       decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.whiteColor),
            //       child: Image.asset(AppImage.shoe2Logo),
            //     ),
            //     const SizedBox(width: 10.0),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
