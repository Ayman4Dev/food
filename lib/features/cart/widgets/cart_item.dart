import 'package:flutter/material.dart';
import 'package:food/shared/castumtext.dart';
import 'package:gap/gap.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.text,
    required this.description,
    required this.image,
    this.onAdd,
    this.onRemove,
    this.onminus,
  });

  final String text;
  final String description;
  final String image;
  final Function()? onAdd;
  final Function()? onRemove;
  final Function()? onminus;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(widget.image, width: 150, height: 100),

                castumText(
                  text: widget.text,
                  fontsize: 15,
                  fontweight: FontWeight.bold,
                ),
                Text(widget.description),
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: widget.onminus,
                          icon: Icon(Icons.remove, size: 15, color: Colors.red),
                        ),
                      ),
                      Gap(40),
                      Text("1"),
                      Gap(40),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: widget.onAdd,
                          icon: Icon(Icons.add, size: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Remove",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
