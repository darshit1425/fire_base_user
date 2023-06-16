import 'package:fire_base_user/screen/account_screen/view/account_screen.dart';
import 'package:fire_base_user/screen/cart_screen/view/cart_screen.dart';
import 'package:fire_base_user/screen/category_screen/view/category_screen.dart';
import 'package:fire_base_user/screen/exit_dilog/view/exit_dilog_screen.dart';
import 'package:fire_base_user/screen/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../images/font_style.dart';
import '../../images/image.dart';
import '../controller/bottom_contoller.dart';

class Bottom_screen extends GetView<HomeController> {
  const Bottom_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      HomeController(),
    );
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: "Categories"),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: "Cart"),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: "Account"),
    ];

    var Screen = [
      Home_Screen(),
      Category_Screen(),
      Cart_screen(),
      Account_Screen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: Screen.elementAt(controller.currentNavIndex.value),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            backgroundColor: Colors.white,
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },

          ),

        ),

      ),

    );

  }

}
