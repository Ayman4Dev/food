import 'package:flutter/material.dart';
import 'package:food/features/cart/widgets/cart_item.dart';
import 'package:food/features/checkout/views/CheckoutView.dart';
import 'package:food/shared/castumtext.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            Gap(10),
            Center(
              child: Text(
                "My Cart",

                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              itemBuilder: (x, y) {
                return CartItem(
                  text: '',
                  description: '',
                  image: 'assets/test/image 3.png',
                );
              },
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
            Gap(50),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(5),
        height: 90,
        child: Row(
          children: [
            Column(
              children: [
                castumText(
                  text: "Total ",
                  fontsize: 20,
                  fontweight: FontWeight.bold,
                ),
                Gap(10),
                castumText(
                  text: "\$ 12.99",
                  fontsize: 20,
                  fontweight: FontWeight.bold,
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkoutview()),
                );
              },
              child: Text(
                "checkout",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
