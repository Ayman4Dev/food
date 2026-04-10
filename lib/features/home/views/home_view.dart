import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/constants/app_colors.dart';
import 'package:food/features/home/widgets/product_card.dart';
import 'package:food/shared/castumtext.dart';
import 'package:food/shared/logo.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['All', 'Combo', 'Sliders', 'Classic'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Gap(40),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/Foodrush2.svg',
                          width: 200,
                        ),
                        Gap(10),
                        Text(
                          "    Hello, Ayman ",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(radius: 30),
                  ],
                ),
                Gap(15),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Gap(25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(category.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(category[index]),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.greenAccent
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Gap(10),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .85,
                    mainAxisSpacing: 2,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      image: "assets/test/image 6.png",
                      name: "بططاطس",
                      description: "مقرمشه",
                      rate: "2.5",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
