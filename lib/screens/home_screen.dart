import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/drawer_component.dart';
import 'package:practice_project/components/widget_component/textField_widget.dart';
import 'package:practice_project/components/widget_component/text_widget.dart';
import 'package:practice_project/components/widget_component/utils_widget.dart';
import 'package:practice_project/model/my_product.dart';
import 'package:practice_project/provider/cart_provider.dart';
import 'package:practice_project/screens/add_to_cart.dart';
import 'package:practice_project/screens/popular_shoes.dart';
import 'package:practice_project/screens/shoe_detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> productLogo = [
    {
      "index": 0,
      "image": AppImage.nikeLogo,
      "name": "Nike",
    },
    {
      "index": 1,
      "image": AppImage.pumaLogo,
      "name": "Puma",
    },
    {
      "index": 2,
      "image": AppImage.converseLogo,
      "name": "Converse",
    },
    {
      "index": 3,
      "image": AppImage.adidasLogo,
      "name": "Adidas",
    },
    {
      "index": 4,
      "image": AppImage.underArmourLogo,
      "name": "UnderArmour",
    },
  ];

  List<Map<String, String>> favoriteShoes = [];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        title: Text(
          "Home Screen",
          style: TextStyle(fontSize: 16.0, fontFamily: "Poppin", fontWeight: FontWeight.w600, color: AppColor.whiteColor),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Image.asset(AppImage.leadIcon),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddToCartScreen()));
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sports",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppin", color: AppColor.blackColor),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 180),
                child: CarouselView(
                  backgroundColor: AppColor.blackColor.withOpacity(0.7),
                  itemExtent: 320,
                  shrinkExtent: 200,
                  children: List<Widget>.generate(
                    3,
                    (int index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(MyProduct.underArmourProduct[index % 3].image),
                      );
                    },
                  ),
                ),
              ),
              appTextField(
                hinttxt: "Looking For Shoes...",
                prefixIcon: const Icon(Icons.search_outlined),
              ),
              const SizedBox(height: 10),
              doubleText(
                  text: "Popular Shoes",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PopularShoes()));
                  }),
              SizedBox(
                height: 225,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: MyProduct.allProduct.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final brandShoes = MyProduct.allProduct[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoeDetail(product: brandShoes)));
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        brandShoes.image,
                                        cacheHeight: 100,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "BEST SELLER",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.mainColor),
                                  ),
                                  Text(
                                    brandShoes.name,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: "Poppin", color: AppColor.blackColor),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${brandShoes.price}",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: "Poppin", color: AppColor.subtitleColor),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          cartProvider.toggleProduct(brandShoes);
                                          Utils.appSnackBar(context, "Product Added:-\n Name: ${brandShoes.name}, Price: ${brandShoes.price}");
                                          log("Product Added:-\n Name: ${brandShoes.name}, Price: ${brandShoes.price}");
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 42,
                                          decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0))),
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
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              doubleText(text: "Selected Brand Shoes", onTap: () {}),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListView.builder(
                    itemCount: MyProduct.allProduct.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      final brandShoes = MyProduct.allProduct[index];

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoeDetail(product: brandShoes)));
                        },
                        child: Card(
                          color: AppColor.whiteColor,
                          elevation: 3.0,
                          child: SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "BEST CHOICE",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.mainColor),
                                      ),
                                      Text(
                                        brandShoes.name.toString(),
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: "Poppin", color: AppColor.blackColor),
                                      ),
                                      Text(
                                        '\$${brandShoes.price.toString()}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: "Poppin", color: AppColor.subtitleColor),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: double.infinity,
                                    width: 130,
                                    child: Image.asset(brandShoes.image.toString()),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
