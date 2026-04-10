import 'package:flutter/material.dart';
import 'package:food/features/product/views/product_details.dart';
import 'package:food/shared/castumtext.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.rate,
  });

  final String image, name, description, rate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (x) {
              return ProductDetails();
            },
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, width: 150, height: 120),

              castumText(text: name, fontsize: 13, fontweight: FontWeight.bold),
              Gap(5),
              castumText(text: description, fontsize: 11),
              Text("⭐ $rate"),
            ],
          ),
        ),
      ),
    );
  }
}
