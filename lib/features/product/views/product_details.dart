import 'package:flutter/material.dart';
import 'package:food/features/product/widgets/castumtopping.dart';
import 'package:food/features/product/widgets/slider.dart';
import 'package:food/shared/castumtext.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/test/details.png", height: 200),
                  ProdactSloder(
                    text:
                        "Customize Your Burger to Your Tastes\n Ultimate Experience",
                    value: .5,
                  ),
                ],
              ),
              Gap(20),
              castumText(
                text: "Toppings",
                fontsize: 18,
                fontweight: FontWeight.bold,
              ),
              Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,

                  children: List.generate(4, (index) {
                    return CastumTopping();
                  }),
                ),
              ),
              Gap(20),
              castumText(
                text: "Side options",
                fontsize: 18,
                fontweight: FontWeight.bold,
              ),
              Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,

                  children: List.generate(4, (index) {
                    return CastumTopping();
                  }),
                ),
              ),
              Gap(20),

              Row(
                children: [
                  Column(
                    children: [
                      castumText(
                        text: "Total ",
                        fontsize: 25,
                        fontweight: FontWeight.bold,
                      ),
                      Gap(10),
                      castumText(
                        text: "\$ 12.99",
                        fontsize: 25,
                        fontweight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(200, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
