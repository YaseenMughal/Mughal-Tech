import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/screens/add_to_cart.dart';
import 'package:practice_project/screens/cartItem.dart';

class ShoeDetail extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  const ShoeDetail({super.key, required this.image, required this.name, required this.price});

  @override
  State<ShoeDetail> createState() => _ShoeDetailState();
}

class _ShoeDetailState extends State<ShoeDetail> {
  final List<String> _shoeSize = ["38", "39", "40", "41", "42", "43", "44", "45"];
  @override
  Widget build(BuildContext context) {
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
            child: const Icon(
              Icons.shopping_bag_outlined,
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
                widget.image,
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
                        widget.name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: "Poppin", color: AppColor.blackColor),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "\$${widget.price}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....",
                        softWrap: true,
                        style: TextStyle(fontSize: 15, color: AppColor.subtitleColor, fontWeight: FontWeight.w400, fontFamily: "Poppin"),
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
                              image: const DecorationImage(image: AssetImage(AppImage.shoe05Img)),
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(13.0),
                              image: const DecorationImage(image: AssetImage(AppImage.shoe01Img)),
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(13.0),
                              image: const DecorationImage(image: AssetImage(AppImage.shoe02Img)),
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
                          const Row(
                            children: [
                              Text("EU"),
                              SizedBox(width: 7.0),
                              Text("US"),
                              SizedBox(width: 7.0),
                              Text("UK"),
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
                            return Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
                                child: Center(
                                    child: Text(
                                  _shoeSize[index],
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                                )),
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
                            CartManager().addItem(CartItem(image: widget.image, name: widget.name, price: widget.price));
                            // CartManager().addItem(CartItem(image: widget.image, name: widget.name, price: widget.price));

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddToCartScreen()));
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
}
