import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_user/screen/cart_screen/contoller/cart_controller.dart';
import 'package:fire_base_user/screen/cart_screen/model/cart_model.dart';
import 'package:fire_base_user/utils/fire_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart_screen extends StatefulWidget {
  const Cart_screen({Key? key}) : super(key: key);

  @override
  State<Cart_screen> createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {
  Cart_Controller contoller = Get.put(Cart_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          leading: Icon(Icons.shopping_bag_outlined),
        ),
        body: StreamBuilder(
          stream: FirebaseHelper.firebaseHelper.GetCartData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              contoller.CartList.clear();
              List<Cart_model> homeList = [];
              QuerySnapshot? snapData = snapshot.data;

              for (var x in snapData!.docs) {
                Map data = x.data() as Map;
                String? name = data['p_name'];
                String? notes = data['p_notes'];
                String? date = data['p_date'];
                String? time = data['p_time'];
                String? price = data['p_price'];
                String? review = data['p_review'];
                String? warranty = data['p_warranty'];
                String? paytypes = data['p_paytypes'];
                String? model = data['p_modelno'];
                String? image = data['p_image'];

                print(name);

                Cart_model c1 = Cart_model(
                  p_name: name,
                  p_warranty: warranty,
                  p_review: review,
                  p_paytypes: paytypes,
                  p_notes: notes,
                  p_modelno: model,
                  p_date: date,
                  p_price: price,
                  p_time: time,
                  key: x.id,
                  p_image: image,
                );

                contoller.CartList.add(c1);
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 225,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {},
                      onDoubleTap: () {
                        var key = contoller.CartList[index].key;
                        FirebaseHelper.firebaseHelper.deleteCartdata(key!);
                        Get.snackbar("Delete", "success");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Colors.black, width: 1.5),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${contoller.CartList[index].p_name}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${contoller.CartList[index].p_price}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Text(
                            //   "Transiction :-${contoller.CartList[index].p_paytypes}",
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            // Text(
                            //   "Notes :-${contoller.CartList[index].p_notes}",
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            // Text(
                            //   "Review :-${contoller.CartList[index].p_review}",
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            // Text(
                            //   "ModelNo :-${contoller.CartList[index].p_modelno}",
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            // Text(
                            //   "Date :-${contoller.CartList[index].p_date}",
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            // Text(
                            //   "Time :-${contoller.CartList[index].p_time}",
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Column(
                              children: [
                                // Text(
                                //   "Image",
                                //   style: TextStyle(color: Colors.white),
                                // ),
                                Image.network(
                                  "${contoller.CartList[index].p_image}",
                                  fit: BoxFit.contain,
                                  height: 125,
                                  width: 135,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: contoller.CartList.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
