import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoomy_project1/home/search_bar.dart';

import '../../Search_page_/search_page.dart';
import '../../profile_page/blue_logo.dart';
import '../NavigationBar_home.dart';
import '../catigory_buttons_bar.dart';
import '../home_slider/slider.dart';
import '../prodects/home_cart.dart';
import '../prodects/model.dart';
import 'catigories_list.dart';

class CatigoriesPage extends StatefulWidget {
  const CatigoriesPage({Key? key, required this.text, required this.prodect}) : super(key: key);
  final String text;
  final Prodect prodect;
  @override
  State<CatigoriesPage> createState() => _CatigoriesPageState(text,prodect);
}

class _CatigoriesPageState extends State<CatigoriesPage> {
  final String text2;
  final Prodect prodect;

  _CatigoriesPageState(this.text2, this.prodect);
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController =
    TextEditingController(text: "");
    final RxBool isEmpty1 = true.obs;
    final RxString text = searchController.text.obs;

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SearchBar(
                      searchController: searchController,
                      onPressed: () {
                        Get.to(Search_page());
                      },
                      onChanged: (String text1) {
                        text.value = text1;

                        if (text.value == "") {
                          isEmpty1.value = true;
                        } else {
                          isEmpty1.value = false;
                        }
                      },
                    ),
                    if (text.value.isEmpty)
                      Container(
                        color: Colors.white30,
                        height: 55,
                        child: CatigoryButtonsBar(),
                      ),
                  ],
                ),
              ),
              ////
              if (text.value.isEmpty)
                Flexible(
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: CatigoriesList(prodect: prodect, text: text2,),
                      )),
                ),

              if (text.value.isNotEmpty)
                Expanded(
                    child: Container(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              ((MediaQuery.of(context).size.height) - 250),
                          children: Prodect.Prodects
                              .where((e) => e.name
                              .toLowerCase()
                              .contains(text.value.toLowerCase()))
                              .map((e) => Cart( prodects: e))
                              .toList(),
                        ))),
              ////
            ],
          );
        }),
      ),
      bottomNavigationBar:NavigationBar_home(),
    );
  }
}
