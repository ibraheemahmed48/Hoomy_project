import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';import 'package:unicons/unicons.dart';import '../api/Api_calls.dart';import '../favorite_page/favorite_page_main.dart';import '../home/home_main_page.dart';import '../profile_page/profile_main_page.dart';import 'my_cart_main.dart';class NavigationBar_cart extends StatelessWidget {  const NavigationBar_cart({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Container(      height: 55,      decoration: BoxDecoration(        boxShadow: [          BoxShadow(            color: Colors.black.withOpacity(0.2),            spreadRadius: 4,            blurRadius: 3,            offset: Offset(0, 0), // changes x,y position of shadow          ),        ],        color: Colors.white,        borderRadius: BorderRadius.only(            topRight: Radius.circular(30), topLeft: Radius.circular(30)),      ),      child: Row(        mainAxisAlignment: MainAxisAlignment.spaceAround,        crossAxisAlignment: CrossAxisAlignment.center,        children: [          IconButton(              onPressed: () {                BackEnd.Prodects_cart = [];                Get.to(HomeMainPage(),transition: Transition.noTransition,duration: Duration(seconds: 1));              },              icon: Icon(Icons.home_filled, color: Colors.black45)),          Container(            width: 50,            height: 50,            decoration: BoxDecoration(                color: Color(0xff45B9EE),                borderRadius: BorderRadius.all(Radius.circular(25))),            child: IconButton(                onPressed: () {                  BackEnd.Get_cart();                  Future.delayed(Duration(seconds: 1),(){                    //  BackEnd.Get_cart();                    Get.off(MyCart(),transition: Transition.noTransition,duration: Duration(seconds: 4));                  });                },                icon: Icon(                  Icons.shopping_cart_outlined,                  color: Colors.white,                )),          ),          IconButton(              onPressed: () {                BackEnd.Prodects_cart = [];                Get.to(FavoritePage(),transition: Transition.noTransition,duration: Duration(seconds: 1));              },              icon: Icon(Icons.favorite, color: Colors.black45)),          IconButton(              onPressed: () {                BackEnd.Prodects_cart = [];                Get.to(profile_main_page(),transition: Transition.noTransition,duration: Duration(seconds: 1));              },              icon: Icon(UniconsLine.user, color: Colors.black45)),        ],      ),    );  }}