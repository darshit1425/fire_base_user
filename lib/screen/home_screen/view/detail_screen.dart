import 'package:fire_base_user/screen/home_screen/model/home_model.dart';
import 'package:fire_base_user/utils/fire_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../images/font_style.dart';

class Details_product extends StatefulWidget {
  const Details_product({Key? key}) : super(key: key);

  @override
  State<Details_product> createState() => _Details_productState();
}

class _Details_productState extends State<Details_product> {
  Home_model data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back(result: "/Home");
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notification_add_outlined,
                color: Colors.black,
              ),
            ),
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  // color: Colors.grey.shade400,
                  height: 300,
                  width: double.infinity,
                  child: Image.network("${data.p_image}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${data.p_name}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 3),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${data.p_review}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),
              Spacer(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {},
                          child: Text(
                            "buy",
                            style: TextStyle(
                                fontFamily: semibold,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          )),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          FirebaseHelper.firebaseHelper.AddtoCart(
                            p_image: data.p_image,
                            p_name: data.p_name,
                            p_warranty: data.p_warranty,
                            p_paytypes: data.p_paytypes,
                            p_notes: data.p_notes,
                            p_modelno: data.p_modelno,
                            p_date: data.p_date,
                            p_price: data.p_price,
                            p_time: data.p_time,
                            p_review: data.p_review,
                          );
                          Get.back();
                        },
                        child: Text("add to cart")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
