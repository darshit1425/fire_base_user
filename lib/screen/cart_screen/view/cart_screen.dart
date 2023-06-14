import 'package:flutter/material.dart';

class Cart_screen extends StatefulWidget {
  const Cart_screen({Key? key}) : super(key: key);

  @override
  State<Cart_screen> createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
    ));
  }
}
