import 'package:flutter/material.dart';
import 'package:food/core/constants/app_colors.dart';
import 'package:food/features/auth/views/profile.dart';
import 'package:food/features/cart/views/cart_view.dart';
import 'package:food/features/home/views/home_view.dart';
import 'package:food/features/orderHistory/views/order_history.dart';

class Root extends StatefulWidget {
  Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller = PageController();
  late List<Widget> screens;
  int currentscreen = 0;

  @override
  void initState() {
    screens = [HomeView(), CartView(), OrderHistory(), Profile()];
    controller = PageController(initialPage: currentscreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.all(10),

        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 15,
          unselectedFontSize: 11,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade700,
          currentIndex: currentscreen,
          onTap: (index) {
            setState(() {
              currentscreen = index;
            });
            controller.jumpToPage(currentscreen);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.time_to_leave),
              label: "Orders",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
