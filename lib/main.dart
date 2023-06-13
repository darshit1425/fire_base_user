import 'package:fire_base_user/utils/notificaton_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => Login_Screen(),
        ),
        GetPage(
          name: '/SingUp',
          page: () => SingUp_Screen(),
        ),
        GetPage(
          name: '/Home',
          page: () => Home_Screen(),
        ),
        GetPage(
          name: '/detalis',
          page: () => Details_product(),
        ),
      ],
    ),
  );
}
