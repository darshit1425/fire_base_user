import 'package:fire_base_user/screen/account_screen/view/account_screen.dart';
import 'package:fire_base_user/screen/bottom_screen/view/bottom_screen.dart';
import 'package:fire_base_user/screen/cart_screen/view/cart_screen.dart';
import 'package:fire_base_user/screen/razor_pay/view/razor_screen.dart';
import 'package:fire_base_user/screen/splsh_screen/view/splsh_screeen.dart';
import 'package:fire_base_user/utils/notificaton_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/category_screen/view/category_screen.dart';
import 'screen/home_screen/view/detail_screen.dart';
import 'screen/home_screen/view/home_screen.dart';
import 'screen/login_screen/view/login_screen.dart';
import 'screen/singup_screen/view/singup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  NotificationHelper.Helper.init();

  runApp(
    GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => Splash_Screen(),
        ),
        GetPage(
          name: '/login',
          page: () => Login_Screen(),
        ),
        GetPage(
          name: '/SingUp',
          page: () => SingUp_Screen(),
        ),
        GetPage(
          name: '/Bottom',
          page: () => Bottom_screen(),
        ),
        GetPage(
          name: '/Home',
          page: () => Home_Screen(),
        ),
        GetPage(
          name: '/detalis',
          page: () => Details_product(),
        ),
        GetPage(
          name: '/Cate',
          page: () => Category_Screen(),
        ),
        GetPage(
          name: '/Cart',
          page: () => Cart_screen(),
        ),
        GetPage(
          name: '/Acco',
          page: () => Account_Screen(),
        ),
      ],
    ),
  );
}
