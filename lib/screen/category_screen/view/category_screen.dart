import 'package:flutter/material.dart';

class Category_Screen extends StatefulWidget {
  const Category_Screen({Key? key}) : super(key: key);

  @override
  State<Category_Screen> createState() => _Category_ScreenState();
}

class _Category_ScreenState extends State<Category_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Category",
          style: TextStyle(),
        ),
      ),
    ));
  }
}
