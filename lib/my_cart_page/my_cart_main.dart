import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:whatsapp/whatsapp.dart';
import '../api/Api_calls.dart';
import '../favorite_page/favorite_page_main.dart';
import '../help/text_style.dart';
import '../home/cart_list.dart';
import '../home/home_main_page.dart';
import '../home/prodects/model.dart';
import '../profile_page/blue_logo.dart';
import '../profile_page/profile_main_page.dart';
import '../whatsapp/whatsapp_main_page.dart';
import 'NavigationBar_cart.dart';
import 'make_order_button.dart';
import 'my_cart_list.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

late final Prodect prodect;

class _MyCartState extends State<MyCart> {
  String text =
      "\nمرحباً ارغب بشراء المنتجات الاتية :     \n\n ${MyCardsList.cartList.map((e) => ({
            "اسم الامنتج :${e.title}\n"
                "العدد :${e.quantity}\n"
                "السعر الكلي  :${" 2000000 " "دينار عراقي"}\n"
                "\n"
                "\n"
          }))}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 20),
                child: Text(
                  'السلة',
                  style: Text_Style.getstyle(
                      fontsize: 28,
                      ColorText: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
              MyCardsList.cartList.length == 0 ?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Image.asset("photo/Empty-bro.png"),
                      Text(
                        textAlign: TextAlign.center,
                        "لا يوجد منتجات في السلة ",
                        style: Text_Style.getstyle(
                            fontsize: 25,
                            ColorText: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ):
              Expanded(child: MyCardsList()),
              Padding(
                padding: const EdgeInsets.only(top:5),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width-10,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black12,spreadRadius: 3,blurRadius: 7,offset: Offset(0,4)),
                      ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(
                              textDirection: TextDirection.rtl,
                              ' السعر الكلي:  ${MyCardsList().getCartTotalPrice().value.ceil().toString()} دع',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 0),
                          child: Button2(
                            text: 'اتمام الطلب',
                            onPressed: () {
                              setState(()  {
                                print(MyCardsList.cartList[0].quantity);
                                print(MyCardsList.cartList[0].title);
                                text=(  "\nمرحباً ارغب بشراء المنتجات الاتية :     \n\n ${MyCardsList.cartList.map((e) => ({
                                  "اسم الامنتج :${e.title}\n"
                                      "العدد :${e.quantity}\n"
                                      "السعر الكلي  :${MyCardsList().getCartTotalPrice().value.ceil().toString()+"دينار عراقي"}\n"
                                      "\n"
                                      "\n"
                                }))}");

                              });
                              Get.to(whatsapp_main_page(
                            text: text,
                          ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
  );
  }
}
