import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/provider/cart_provider.dart';
import 'package:practice_project/screens/cartItem.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final finalList = cartProvider.cart;

    buildProductQuantity({required IconData icon, required int index, Color? color, Color? iconColor}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add ? cartProvider.incrementQuantity(index) : cartProvider.decrementQuantity(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color ?? AppColor.whiteColor),
          child: Icon(icon, color: iconColor ?? AppColor.blackColor),
        ),
      );
    }

    buildBottomSheetRow({required String text1, required String text2}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColor.subtitleColor, fontFamily: "Poppin")),
          Text(text2, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: AppColor.titleColor, fontFamily: "Poppin"))
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        leading: AppButton.arrowButtom(
          context: context,
        ),
        title: Text(
          "Add to Cart",
          style: TextStyle(fontSize: 16.0, fontFamily: "Poppin", fontWeight: FontWeight.w600, color: AppColor.whiteColor),
        ),
      ),
      body: finalList.isEmpty
          ? Center(
              child: Text(
                "Empty Cart",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: AppColor.blackColor, fontFamily: "Poppin"),
              ),
            )
          : SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
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
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: AppColor.whiteColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(finalList[index].image),
                                ),
                                const SizedBox(width: 15.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      finalList[index].name,
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColor.titleColor, fontFamily: "Poppin"),
                                    ),
                                    Text(
                                      "\$${finalList[index].price}",
                                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColor.subtitleColor, fontFamily: "Poppin"),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          buildProductQuantity(icon: Icons.remove, index: index, color: Colors.grey[300]),
                                          Text(
                                            finalList[index].quantity.toString(),
                                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: "Poppin", color: AppColor.blackColor),
                                          ),
                                          buildProductQuantity(icon: Icons.add, index: index, color: AppColor.mainColor, iconColor: AppColor.whiteColor)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            finalList.removeAt(index);
                                          });
                                        },
                                        child: const Icon(Icons.delete, color: Colors.red)),
                                  ),
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
      bottomSheet: Container(
          height: MediaQuery.of(context).size.height * .3,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            color: AppColor.whiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildBottomSheetRow(text1: "Total Item", text2: finalList.length.toString()),
                const SizedBox(height: 20.0),
                buildBottomSheetRow(text1: "Total Price", text2: "\$${cartProvider.getTotalPrice()}"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Divider(
                    thickness: 2.0,
                    color: AppColor.subtitleColor,
                  ),
                ),
                AppButton.mainButton(
                  text: "CheckOut",
                )
              ],
            ),
          )),
    );
  }
}
