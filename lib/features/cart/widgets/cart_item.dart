import 'package:flutter/material.dart';
import 'package:food/shared/castumtext.dart';
import 'package:gap/gap.dart';

class CartItem extends StatefulWidget {
  CartItem({
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
  int count = 1;

  void add() {
    setState(() {
      count++;
    });
  }

  void minus() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  void remove() {
    setState(() {
      count = 0;
    });

    widget.onRemove?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) return const SizedBox();

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
                          onPressed: minus,
                          icon: const Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const Gap(40),
                      Text("$count"),
                      const Gap(40),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: add,
                          icon: const Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  onPressed: remove,
                  child: const Text(
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
