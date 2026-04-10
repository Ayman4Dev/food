import 'package:flutter/material.dart';
import 'package:food/shared/castumtext.dart';
import 'package:gap/gap.dart';

class CastumTopping extends StatelessWidget {
  const CastumTopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 110,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/test/tomato.png", height: 200),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                castumText(
                  text: "Tomato",
                  fontsize: 15,
                  textcolor: Colors.white,
                ),
                Gap(10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.add, color: Colors.white),
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
