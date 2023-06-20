import 'package:fire_base_user/screen/home_screen/controller/home_controller.dart';
import 'package:fire_base_user/screen/images/font_style.dart';
import 'package:fire_base_user/utils/fire_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  @override
  Home_Controller contoller = Get.put(Home_Controller());
  bool isLogin = false;

  void initState() {
    super.initState();
    FirebaseHelper.firebaseHelper.initFirebaseMessage();

    isLogin = FirebaseHelper.firebaseHelper.CheckUser();
    contoller.userDetail.value = FirebaseHelper.firebaseHelper.UserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings_sharp),
            )
          ],
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Account",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.grey.shade500,
                    )),
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage("${contoller.userDetail['image']}"),
                ),
                SizedBox(height: 10),
                Text(
                  "${contoller.userDetail['name']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${contoller.userDetail['email']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    await FirebaseHelper.firebaseHelper.signOut();

                  },
                  child: Container(
                    height: 50,
                    width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border:
                        Border.all(color: Colors.white, width: 2),
                        color: Colors.black,
                      ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
