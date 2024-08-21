// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:practice_project/drawer_screen/profile_drawer.dart';
// import 'package:practice_project/screens/home_screen.dart';

// class CustomBottomNavigationBar extends StatelessWidget {

// int currentIndex = 0;

// List screens = [
//   const HomeScreen(),
//   const PersonScreen(),
//   // FavouriteScreen(shoeDataList: favoriteShoes),
//   const PersonScreen()
// ];

//   final int selectedIndex;
//   final Function(int) onItemSelected;

//   const CustomBottomNavigationBar({
//     required this.selectedIndex,
//     required this.onItemSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: selectedIndex,
//       selectedItemColor: Colors.green,
//       unselectedItemColor: Colors.grey,
//       onTap: onItemSelected,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favourite"),
//       ],

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/widget_component/utils_widget.dart';
import 'package:practice_project/drawer_screen/profile_drawer.dart';
import 'package:practice_project/screens/favourite_screen.dart';
import 'package:practice_project/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  List screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          // Handle tap on "Person" tab
          if (value == 2) {
            Utils.toastMessage(message: "Coming Soon..", bgColor: AppColor.mainColor, gravity: ToastGravity.CENTER);
          } else {
            // Update index for other tabs
            setState(() {
              currentIndex = value;
            });
          }
        },
        selectedItemColor: AppColor.blackColor,
        selectedIconTheme: IconThemeData(color: AppColor.blackColor),
        unselectedItemColor: AppColor.subtitleColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home", activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favourite", activeIcon: Icon(Icons.favorite)),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: "Person", activeIcon: Icon(Icons.person)),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
