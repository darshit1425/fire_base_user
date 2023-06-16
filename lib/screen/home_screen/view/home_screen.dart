import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_user/screen/home_screen/list/lists.dart';
import 'package:fire_base_user/screen/home_screen/model/home_model.dart';
import 'package:fire_base_user/screen/images/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/fire_base_helper.dart';
import '../controller/home_controller.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Home_Controller contoller = Get.put(Home_Controller());
  bool isLogin = false;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    FirebaseHelper.firebaseHelper.initFirebaseMessage();

    isLogin = FirebaseHelper.firebaseHelper.CheckUser();
    contoller.userDetail.value = FirebaseHelper.firebaseHelper.UserData();
  }

  //
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
  //     if (_currentPage < sliderList.length) {
  //       _currentPage++;
  //     } else {
  //       _currentPage = 0;
  //     }
  //
  //     _pageController.animateToPage(
  //       _currentPage,
  //       duration: const Duration(milliseconds: 200),
  //       curve: Curves.easeIn,
  //     );
  //     _pageController1.animateToPage(
  //       _currentPage,
  //       duration: const Duration(milliseconds: 200),
  //       curve: Curves.easeIn,
  //     );
  //     _pageController3.animateToPage(
  //       _currentPage,
  //       duration: const Duration(milliseconds: 200),
  //       curve: Curves.easeIn,
  //     );
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _timer.cancel();
  // }
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _pageController1 = PageController(initialPage: 0);
  final PageController _pageController3 = PageController(initialPage: 0);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text("Flipkart"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
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
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${contoller.userDetail['email']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: Get.height * 0.07,
                decoration: BoxDecoration(
                  // border: B,
                  borderRadius: BorderRadius.circular(10),
                  color: lightGrey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // controller: controller.searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search anything....",
                      hintStyle: const TextStyle(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 5),
              //   // padding: const EdgeInsets.symmetric(horizontal: 1),
              //   height: Get.height * 0.23,
              //   width: MediaQuery.of(context).size.width,
              //   child: PageView.builder(
              //     controller: _pageController,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: sliderList.length,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(10),
              //           child: Image.asset(
              //             sliderList[index],
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 10),

              Expanded(
                child: StreamBuilder(
                  stream: FirebaseHelper.firebaseHelper.GetData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      contoller.DataList.clear();
                      List<Home_model> homeList = [];
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

                        Home_model home_model = Home_model(
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

                        contoller.DataList.add(home_model);
                      }
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 350,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed("/detalis",
                                    arguments: contoller.DataList[index]);
                              },
                              // onLongPress: () {
                              //   // FirebaseHelper.firebaseHelper
                              //   // .UpadteData(Home_model[index].key);
                              //
                              //   Home_model home_model = Home_model(
                              //     key: contoller.DataList[index].key,
                              //     p_time: contoller.DataList[index].p_time,
                              //     p_price: contoller.DataList[index].p_price,
                              //     p_date: contoller.DataList[index].p_date,
                              //     p_modelno: contoller.DataList[index].p_modelno,
                              //     p_notes: contoller.DataList[index].p_notes,
                              //     p_paytypes: contoller.DataList[index].p_paytypes,
                              //     p_review: contoller.DataList[index].p_review,
                              //     p_warranty: contoller.DataList[index].p_warranty,
                              //     p_name: contoller.DataList[index].p_name,
                              //     p_image: contoller.DataList[index].p_image,
                              //     checkupdate: 1,
                              //   );
                              //
                              //   Get.toNamed("/add", arguments: home_model);
                              // },
                              // onDoubleTap: () {
                              //   var key = contoller.DataList[index].key;
                              //   FirebaseHelper.firebaseHelper.deletedata(key!);
                              //   Get.snackbar("Delete", "success");
                              // },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  border:
                                      Border.all( width: 5),
                                  color: Color(0xffC1B2AD),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Name :-${contoller.DataList[index].p_name}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Price :-${contoller.DataList[index].p_price}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    // SizedBox(
                                    //   height: 5,
                                    // ),
                                    // Text(
                                    //   "Transiction :-${contoller.DataList[index].p_paytypes}",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    // Text(
                                    //   "Notes :-${contoller.DataList[index].p_notes}",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    // Text(
                                    //   "Review :-${contoller.DataList[index].p_review}",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    // Text(
                                    //   "ModelNo :-${contoller.DataList[index].p_modelno}",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    // Text(
                                    //   "Date :-${contoller.DataList[index].p_date}",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    // Text(
                                    //   "Time :-${contoller.DataList[index].p_time}",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Image",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Image.network(
                                          "${contoller.DataList[index].p_image}",
                                          fit: BoxFit.contain,
                                          height: 120,
                                          width: 120,
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
                        itemCount: contoller.DataList.length,
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
