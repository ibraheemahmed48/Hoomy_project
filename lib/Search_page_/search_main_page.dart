import 'package:app_popup_menu/app_popup_menu.dart';import 'package:dropdown_button2/dropdown_button2.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';import 'package:get/get.dart';import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';import 'package:google_fonts/google_fonts.dart';import 'package:hoomy_project1/home/cart_list.dart';import 'package:hoomy_project1/home/prodects/home_cart.dart';import 'package:hoomy_project1/home/prodects/model.dart';import 'package:hoomy_project1/profile_page/blue_logo.dart';import 'package:unicons/unicons.dart';import '../NavigationBar/NavigationBar_defult.dart';import '../Sign_up_page/text_Field.dart';import 'package:unicons/unicons.dart';import 'dart:convert';class Search_main_page extends StatefulWidget {  const Search_main_page({Key? key, required this.from, required this.to, required this.catigory}) : super(key: key);  final String from;  final String to;  final String catigory;  @override  State<Search_main_page> createState() => _Search_main_pageState(from,to,catigory);}class _Search_main_pageState extends State<Search_main_page> {  final String from;  final String to;  final String catigory;  _Search_main_pageState(this.from, this.to, this.catigory);  String? selectedValue;  final BorderRadius _borderRadius = const BorderRadius.only(    topLeft: Radius.circular(30),    topRight: Radius.circular(30),  );  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(    borderRadius: BorderRadius.only(      bottomRight: Radius.circular(0),      bottomLeft: Radius.circular(0),      topRight: Radius.circular(30),      topLeft: Radius.circular(30),    ),  );  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;  EdgeInsets padding = const EdgeInsets.all(0);  int _selectedItemPosition = 0;  SnakeShape snakeShape = SnakeShape.circle;  bool showSelectedLabels = false;  bool showUnselectedLabels = false;  Color selectedColor = Color(0xff45B9EE);  Color unselectedColor = Colors.black38;  Color? containerColor;  List<Color> containerColors = [    const Color(0xFFFFFFFF),  ];  // final String typed_from = "";  // RxString typed_to = '1500'.obs;  // RxString catigory_search = 'dd'.obs;  // var from = int.parse("$typed_from");  // RxInt typed= 0.obs;  //  //  // var a = "0x1E"; // Hexadecimal value for 30  // var b = int.parse(a);//  int b = int.parse(a);  @override  Widget build(BuildContext context) {    return Scaffold(        backgroundColor: Colors.white,        body: SafeArea(          child: SingleChildScrollView(            child: Column(              children: [                Hoomy_logo_blue(onPressed: () {                  Navigator.of(context).pop();                }),                Padding(                  padding: const EdgeInsets.only(right: 20),                  child: Align(                    alignment: Alignment.centerRight,                    child: Container(                      width: 150,                      height: 50,                      child: Align(                        alignment: Alignment.centerRight,                        child: Text(                          "نتائج البحث",                          style: GoogleFonts.inter(                              fontSize: 30,                              color: Colors.black,                              fontWeight: FontWeight.bold),                        ),                      ),                    ),                  ),                ),                Container(                    height: MediaQuery.of(context).size.height,                    width: double.infinity,                    decoration: BoxDecoration(                        color: Color(0XFFE1F8FF),                        borderRadius: BorderRadius.only(                            topLeft: Radius.circular(30),                            topRight: Radius.circular(30))),                    child: Padding(                        padding:                        const EdgeInsets.only(left: 10, right: 10, top: 5),                        child: Container(                            child: GridView.count(                              crossAxisCount: 2,                              childAspectRatio: MediaQuery.of(context).size.width /                                  ((MediaQuery.of(context).size.height) - 250),                              children: Prodect.Prodects.where((e) => e.name                                  .toLowerCase()                                  .contains(catigory.toLowerCase())&&e.price.value <= to_int(x: to)&&e.price.value>to_int(x: from))                                  .map((e) => Cart(                                prodects: e,                              ))                                  .toList(),                            )))),              ],            ),          ),        ),        bottomNavigationBar: NavigationBar_defult()    );  }  int to_int({required String x}) {    int a = int.parse(x);    return a;  }}