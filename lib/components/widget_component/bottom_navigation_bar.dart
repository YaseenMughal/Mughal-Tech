// // bottom_navigation_bar_widget.dart
// import 'package:flutter/material.dart';
// import 'package:practice_project/screens/favourite_screen.dart';
// import 'package:practice_project/screens/forget_screen.dart';
// import 'package:practice_project/screens/home_screen.dart';

// class BottomNavigationBarWidget extends StatefulWidget {
//   final List<Map<String, String>> shoeDataList;
//   BottomNavigationBarWidget({required this.shoeDataList});
//   @override
//   _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
// }

// class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
//   int _selectedIndex = 0;

//   static final List<Widget> _widgetOptions = <Widget>[
//     const HomeScreen(),
//     FavouriteScreen(shoeDataList: []),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           body: _widgetOptions.elementAt(index),
//           bottomNavigationBar: BottomNavigationBarWidget(
//             shoeDataList: widget.shoeDataList,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.amber[800],
//       onTap: _onItemTapped,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favourite"),
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: onItemSelected,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favourite"),
      ],
    );
  }
}
