import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/model/product_model.dart';
import 'package:practice_project/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Card(
      elevation: 4.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0, bottom: 2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => provider.toggleFavorite(widget.product),
                  child: Icon(
                    provider.isExist(widget.product) ?
                    Icons.favorite : Icons.favorite_outline ,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Image.asset(
                  widget.product.image,
                  cacheHeight: 75,
                ),
              ),
              const Spacer(),
              Text(
                widget.product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColor.titleColor,
                  fontFamily: "Poppin",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '\$${widget.product.price}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColor.subtitleColor,
                  fontFamily: "Poppin",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Orignal ${widget.product.brand}",
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.mainColor,
                  fontFamily: "Poppin",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
