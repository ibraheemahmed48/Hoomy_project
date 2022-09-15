import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';import 'package:unicons/unicons.dart';import '../favorite_page/favorite_page_main.dart';import '../my_cart_page/my_cart_main.dart';import '../profile_page/profile_main_page.dart';import 'home_main_page.dart';class NavigationBar_home extends StatelessWidget {  const NavigationBar_home({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Container(      height: 55,      decoration: BoxDecoration(        color: Colors.white,        borderRadius: BorderRadius.only(            topRight: Radius.circular(20), topLeft: Radius.circular(20)),      ),      child: Row(        mainAxisAlignment: MainAxisAlignment.spaceAround,        crossAxisAlignment: CrossAxisAlignment.center,        children: [          Container(            width: 50,            height: 50,            decoration: BoxDecoration(                color: Color(0xff45B9EE),                borderRadius: BorderRadius.all(Radius.circular(25))),            child: IconButton(                onPressed: () {                  Get.to(HomeMainPage());                },                icon: Icon(                  Icons.home_filled,                  color: Colors.white,                )),          ),          IconButton(              onPressed: () {                Get.to(MyCart());              },              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black45)),          IconButton(              onPressed: () {                Get.to(FavoritePage());              },              icon: Icon(Icons.favorite, color: Colors.black45)),          IconButton(              onPressed: () {                Get.to(profile_main_page());              },              icon: Icon(UniconsLine.user, color: Colors.black45)),        ],      ),    );  }}