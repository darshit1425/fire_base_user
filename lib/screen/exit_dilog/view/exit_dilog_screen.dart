
import 'package:fire_base_user/screen/images/font_style.dart';
import 'package:fire_base_user/screen/images/smart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../images/colors.dart';

Widget exitDialog(context){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      // height: 150,
      // width: 100,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(color: lightGrey,borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Confirm",style: TextStyle(color: darkFontGrey,fontSize: 18,fontFamily: bold)),
          SizedBox(height: 10),
          Text("Are you sure you want to exit?",style: TextStyle(fontSize: 16,color: darkFontGrey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ourButton(
                color: Colors.red,
                onPress: (){
                  SystemNavigator.pop();
                },
                textColor: Colors.white,
                title: "Yes",
              ),
              ourButton(
                color: Colors.red,
                onPress: (){
                  Navigator.pop(context);
                },
                textColor: Colors.white,
                title: "No",
              ),
            ],
          ),
        ],
      ),
    ),
  );
}