import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/drawer_screen/profile_drawer.dart';
import 'package:practice_project/screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
        child: Column(
          children: [
            CircleAvatar(radius: 55, child: Image.asset("assets/images/PngItem_526033.png")),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Divider(
                color: AppColor.subtitleColor,
              ),
            ),
            drawerTile(
                title: "Profile",
                icon: Icons.person_outline,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PersonScreen()));
                }),
            drawerTile(title: "Setting", icon: Icons.settings_outlined, onTap: () {}),
            drawerTile(title: "Privacy & Policy", icon: Icons.privacy_tip_outlined, onTap: () {}),
            drawerTile(
                title: "LogOut",
                icon: Icons.logout_outlined,
                iconColor: Colors.red,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                }),
          ],
        ),
      ),
    );
  }

  Widget drawerTile({required String title, required IconData icon, void Function()? onTap, Color? iconColor}) {
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
              offset: Offset(0, 2),
              color: Color.fromRGBO(223, 222, 222, 1),
            ),
          ],
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(color: Colors.black, fontFamily: "Poppin", fontWeight: FontWeight.w500),
          ),
          trailing: Icon(icon, color: iconColor ?? AppColor.subtitleColor),
        ),
      ),
    );
  }
}
