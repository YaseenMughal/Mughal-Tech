import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/screens/cartItem.dart';

class AddToCartScreen extends StatefulWidget {
  // final String image;
  // final String name;
  // final String price;
  const AddToCartScreen({
    super.key,
    // required this.image,
    // required this.name,
    // required this.price,
  });

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  int _productQuantity = 1;

  void _incrementQuantity() {
    setState(() {
      _productQuantity++;
    });
  }

  void _decrementQuantity() {
    if (_productQuantity > 1) {
      setState(() {
        _productQuantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppButton.arrowButtom(
          context: context,
        ),
        title: Text(
          "Add to Cart",
          style: TextStyle(fontSize: 16.0, fontFamily: "Poppin", fontWeight: FontWeight.w600, color: AppColor.blackColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: CartManager().cartItems.length,
                itemBuilder: (context, index) {
                  final item = CartManager().cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12.0)),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(item.image))),
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontFamily: "Poppin", color: AppColor.blackColor),
                              ),
                              Text(
                                "\$${item.price}",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "Poppin", color: AppColor.blackColor),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: _decrementQuantity,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(Icons.remove, color: AppColor.whiteColor),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '$_productQuantity',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      InkWell(
                                        onTap: _incrementQuantity,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(Icons.add, color: AppColor.whiteColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Spacer(),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          CartManager().cartItems.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
          const Expanded(
            flex: 2,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
