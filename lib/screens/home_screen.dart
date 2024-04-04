import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/screens/splash_screen.dart';
import 'package:practice_project/drawer_screen/profile_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.shopping_bag_outlined,
          ),
        ],

        // centerTitle: ,
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileDrawerScreen()));
                },
                tileColor: Colors.black,
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.person, color: Colors.white),
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
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
                },
                tileColor: Colors.black,
                title: Text(
                  "LogOut",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.logout_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
