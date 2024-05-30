import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/product_card.dart';
import 'package:practice_project/model/my_product.dart';
import 'package:practice_project/screens/shoe_detail_screen.dart';

class PopularShoes extends StatefulWidget {
  const PopularShoes({super.key});

  @override
  State<PopularShoes> createState() => _PopularShoesState();
}

class _PopularShoesState extends State<PopularShoes> {
  int isSelected = 0;

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

  Padding buildProduct({required int index, required String image, required String name}) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, right: 2.0, bottom: 2.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: isSelected == index ? AppColor.mainColor : Colors.transparent,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
                child: Container(
                  height: isSelected == index ? 40 : 60,
                  width: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: isSelected == index ? AppColor.whiteColor : Colors.grey,
                        blurRadius: 0.6,
                        spreadRadius: 0.4,
                      ),
                    ],
                    color: AppColor.whiteColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
              if (isSelected == index)
                Text(
                  name,
                  style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor, fontFamily: "Poppin", fontWeight: FontWeight.w500),
                ),
              const SizedBox(width: 10.0)
            ],
          ),
        ),
      ),
    );
  }

  buildNike() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0, childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.nikeProduct.length,
      itemBuilder: (context, index) {
        final nikeList = MyProduct.nikeProduct[index];
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoeDetail(product: nikeList)));
            },
            child: ProductCard(product: nikeList));
      },
    );
  }

  buildPuma() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0, childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.pumaProduct.length,
      itemBuilder: (context, index) {
        final pumaList = MyProduct.pumaProduct[index];
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoeDetail(product: pumaList)));
            },
            child: ProductCard(product: pumaList));
      },
    );
  }

  buildConverse() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0, childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.converseProduct.length,
      itemBuilder: (context, index) {
        final converseList = MyProduct.converseProduct[index];
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoeDetail(product: converseList)));
            },
            child: ProductCard(product: converseList));
      },
    );
  }

  buildAdidas() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0, childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.adidasProduct.length,
      itemBuilder: (context, index) {
        final adidasList = MyProduct.adidasProduct[index];
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoeDetail(product: adidasList)));
            },
            child: ProductCard(product: adidasList));
      },
    );
  }

  buildUnderArmour() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0, childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.underArmourProduct.length,
      itemBuilder: (context, index) {
        final underArmourList = MyProduct.underArmourProduct[index];
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoeDetail(product: underArmourList)));
            },
            child: ProductCard(product: underArmourList));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          "Branded shoes",
          style: TextStyle(fontSize: 16.0, fontFamily: "Poppin", fontWeight: FontWeight.w600, color: AppColor.blackColor),
        ),
        centerTitle: true,
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
              Icons.shopping_bag_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                itemCount: productLogo.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildProduct(index: productLogo[index]['index'], image: productLogo[index]['image'], name: productLogo[index]['name']);
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
                child: isSelected == 0
                    ? buildNike()
                    : isSelected == 1
                        ? buildPuma()
                        : isSelected == 2
                            ? buildConverse()
                            : isSelected == 3
                                ? buildAdidas()
                                : buildUnderArmour())
          ],
        ),
      ),
    );
  }
}
