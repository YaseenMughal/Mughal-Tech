import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';

class FavouriteScreen extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  const FavouriteScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Map<String, String>> shoeDataList = [];

  @override
  void initState() {
    addUserDataToList();
    super.initState();
  }

  void addUserDataToList() {
    shoeDataList.add({
      'shoeImage': widget.image,
      'shoeName': widget.name,
      'shoePrice': widget.price,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppButton.arrowButtom(
          context: context,
        ),
        title: Text(
          "Favourite Shoe's",
          style: TextStyle(fontSize: 16, color: AppColor.blackColor),
        ),
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
              Icons.favorite_outline,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: GridView.builder(
                  itemCount: shoeDataList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10.0),
                  itemBuilder: (context, index) {
                    final shoeData = shoeDataList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [BoxShadow(blurRadius: 4, spreadRadius: 2, offset: Offset(5, 5), color: Color.fromRGBO(238, 238, 238, 1))],
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                              width: double.infinity,
                              child: Image.asset(
                                shoeData['shoeImage'] ?? '',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BEST SELLER",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.mainColor),
                                ),
                                Text(
                                  shoeData['shoeName'] ?? '',
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                                ),
                                Text(
                                  shoeData['shoePrice'] ?? '',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.blackColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
