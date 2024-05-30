import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/components/widget_component/utils_widget.dart';
import 'package:practice_project/model/product_model.dart';
import 'package:practice_project/provider/cart_provider.dart';
import 'package:practice_project/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class ShoeDetail extends StatefulWidget {
  final Product product;

  const ShoeDetail({super.key, required this.product});

  @override
  State<ShoeDetail> createState() => _ShoeDetailState();
}

class _ShoeDetailState extends State<ShoeDetail> {
  final List<Map<String, dynamic>> _shoeSize = [
    {'index': 0, 'size': '38'},
    {'index': 1, 'size': '39'},
    {'index': 2, 'size': '40'},
    {'index': 3, 'size': '41'},
    {'index': 4, 'size': '42'},
    {'index': 5, 'size': '43'},
    {'index': 6, 'size': '44'},
    {'index': 7, 'size': '45'},
  ];

  // final List<String> _shoeSize = ["38", "39", "40", "41", "42", "43", "44", "45"];

  int isSelectedSizeInNumber = 0;
  int isSelectedSizeInWord = 0;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        leading: AppButton.arrowButtom(
          context: context,
        ),
        title: Text(
          "Men's Shoe",
          style: TextStyle(fontSize: 16.0, fontFamily: "Poppin", fontWeight: FontWeight.w600, color: AppColor.blackColor),
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
              onTap: () => favoriteProvider.toggleFavorite(widget.product),
              child: Icon(
                favoriteProvider.isExist(widget.product) ? Icons.favorite : Icons.favorite_outline,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                widget.product.image,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    boxShadow: const [BoxShadow(blurRadius: 8, spreadRadius: 5, offset: Offset(2, 2), color: Color.fromRGBO(224, 224, 224, 1))],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "BEST SELLER",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "Poppin", color: AppColor.mainColor),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        widget.product.name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: "Poppin", color: AppColor.blackColor),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "\$${widget.product.price}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....",
                        softWrap: true,
                        style: TextStyle(fontSize: 14, color: AppColor.subtitleColor, fontWeight: FontWeight.w400, fontFamily: "Poppin"),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Gallery",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(13.0),
                              image: const DecorationImage(image: AssetImage(AppImage.nike04Img)),
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(13.0),
                              image: const DecorationImage(image: AssetImage(AppImage.adidas03Img)),
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(13.0),
                              image: const DecorationImage(image: AssetImage(AppImage.puma05Img)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                          ),
                          Row(
                            children: [
                              sizeEnglish(index: 0, text: "EU"),
                              sizeEnglish(index: 1, text: "US"),
                              sizeEnglish(index: 2, text: "UK"),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _shoeSize.length,
                          itemBuilder: (context, index) {
                            final indexx = _shoeSize[index]['index'];
                            return Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelectedSizeInNumber = indexx;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: isSelectedSizeInNumber == indexx ? AppColor.mainColor : Colors.grey[300]),
                                  child: Center(
                                      child: Text(
                                    _shoeSize[indexx]['size'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppin",
                                        color: isSelectedSizeInNumber == indexx ? AppColor.whiteColor : AppColor.blackColor),
                                  )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      AppButton.mainButton(
                          text: "Add to Cart",
                          btnTextColor: AppColor.whiteColor,
                          onTap: () {
                            cartProvider.toggleProduct(widget.product);
                            Utils.appSnackBar(context, "Product Added:-\n Name: ${widget.product.name}, Price: ${widget.product.price}");
                            log("Product Added:-\n Name: ${widget.product.name}, Price: ${widget.product.price}");
                          })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sizeEnglish({required int index, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelectedSizeInWord = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: isSelectedSizeInWord == index ? AppColor.mainColor : Colors.transparent,
            border: Border.all(color: isSelectedSizeInWord == index ? AppColor.blackColor : AppColor.mainColor, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Text(
              text,
              style: TextStyle(
                color: isSelectedSizeInWord == index ? AppColor.whiteColor : AppColor.blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
