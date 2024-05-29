import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/screens/shoe_detail_screen.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Map<String, String>> shoeDataList;

  const FavouriteScreen({required this.shoeDataList});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppButton.arrowButtom(
          context: context,
        ),
        title: Text(
          "Favourite Shoe's",
          style: TextStyle(fontSize: 16.0, fontFamily: "Poppin", fontWeight: FontWeight.w600, color: AppColor.blackColor),
        ),
        actions: <Widget>[
          // const SizedBox(width: 20),
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
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: GridView.builder(
                  itemCount: widget.shoeDataList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final shoeData = widget.shoeDataList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShoeDetail(image: shoeData['shoeImage'] ?? '', name: shoeData['shoeName'] ?? '', price: shoeData['shoePrice'] ?? ''),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2.0,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.favorite_border_outlined, color: AppColor.blackColor),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    height: 70,
                                    width: double.infinity,
                                    child: Image.asset(
                                      shoeData['shoeImage'] ?? '',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Text(
                                  "BEST SELLER",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.mainColor),
                                ),
                                Text(
                                  shoeData['shoeName'] ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                                ),
                                Text(
                                  "\$${shoeData['shoePrice'] ?? ''}",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.blackColor),
                                )
                              ],
                            ),
                          ),
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
