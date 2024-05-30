import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/provider/favorite_provider.dart';
import 'package:practice_project/screens/add_to_cart.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  // final List<Map<String, String>> shoeDataList;

  // const FavouriteScreen({required this.shoeDataList});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final finalList = provider.favourite;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Favourite Shoe's",
          style: TextStyle(fontSize: 16.0, fontFamily: "Poppin", fontWeight: FontWeight.w600, color: AppColor.whiteColor),
        ),
        actions: <Widget>[
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddToCartScreen()));
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: finalList.isEmpty
          ? Center(
              child: Text(
                "Empty Favourite Shoes",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: AppColor.blackColor, fontFamily: "Poppin"),
              ),
            )
          : SafeArea(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                finalList.removeAt(index);
                              });
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: AppColor.whiteColor,
                            label: "Delete",
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: ListTile(
                        tileColor: AppColor.whiteColor,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              finalList[index].brand,
                              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: AppColor.mainColor, fontFamily: "Poppin"),
                            ),
                            Text(
                              finalList[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColor.blackColor, fontFamily: "Poppin"),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          finalList[index].description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: AppColor.subtitleColor, fontFamily: "Poppin"),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(finalList[index].image),
                          ),
                        ),
                        trailing: Text(
                          "\$${finalList[index].price}",
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColor.subtitleColor, fontFamily: "Poppin"),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
