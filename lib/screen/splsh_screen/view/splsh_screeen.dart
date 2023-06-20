import 'dart:async';

import 'package:fire_base_user/utils/fire_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  bool isLogin = false;

  void initState() {
    super.initState();
    isLogin = FirebaseHelper.firebaseHelper.CheckUser();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => isLogin == true
            ? Get.offAndToNamed("/Bottom")
            : Get.offAndToNamed("/login"));
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xff00255C),

        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.black,
        //   title: Text("Splash screen",style: TextStyle(color: Colors.white),),
        // ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Image.asset("assets/images/spl.png",fit: BoxFit.cover
                ),
              SizedBox(height: 100,),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
