import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoomy_project1/api/Api_calls.dart';
import 'package:ionicons/ionicons.dart';
import '../../api/api_Url.dart';
import '../../api/api_models.dart';
import '../../help/text_style.dart';
import '../../single_prodect/single_prodect_main.dart';
import 'model.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, required this.prodects}) : super(key: key);
  final int prodects;

  @override
  State<Cart> createState() => _CartState(prodects);
}

class _CartState extends State<Cart> {
  final int prodects;

  _CartState(this.prodects);

  @override
  Widget build(BuildContext context) {
    int len = BackEnd.Prodects3[prodects].title.length;
    return GestureDetector(
      onTap: () {
        setState(() {
          //api!.makeAsClicked();
          Get.to(SingleProdect(
            prodects: prodects,
          ));
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {});


                          if (BackEnd.Prodects3[prodects].isFav == false)
                            BackEnd.Prodects3[prodects].isFav = true;
                          else
                            BackEnd.Prodects3[prodects].isFav = false;

                          print(BackEnd.favList);


                        },
                        child: BackEnd.Prodects3[prodects].isFav == false
                            ? Icon(Ionicons.heart,
                                color: Color.fromRGBO(69, 185, 238, 1))
                            : Icon(Ionicons.heart, color: Color(0XFFFF0000)),
                        //     child:Icon(Ionicons.heart , color: Colors.red) ,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0XFFE7E7E7),
                          fixedSize: const Size(26, 26),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                    if (BackEnd.Prodects3[prodects].isAvailable == false)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(' ?????? ??????????',
                            style: Text_Style.getstyle(fontsize: 14, ColorText: Colors.red, fontWeight: FontWeight.w600)),
                      ),
                  ],
                ),
              ),
              if (BackEnd.Prodects3[prodects].isAvailable == true)
                Container(
                  height: 128,
                  width: MediaQuery.of(context).size.width - 50,
                  margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        ApiConstants.Domain +
                            BackEnd.Prodects3[prodects].banner,
                        fit: BoxFit.cover),
                  ),
                ),
              if (BackEnd.Prodects3[prodects].isAvailable == false)
                Container(
                    width: 150,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black,
                    ),
                    margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                    child: Image.network(
                        ApiConstants.Domain +
                            BackEnd.Prodects3[prodects].banner,
                        fit: BoxFit.cover)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (BackEnd.Prodects3[prodects].isAvailable == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () async {
                            await BackEnd.add_to_card(
                                id: BackEnd.Prodects3[prodects].id);
                          },
                          child: Icon(Ionicons.cart,
                              color: Color.fromRGBO(69, 185, 238, 1)),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0XFFE7E7E7),
                            fixedSize: const Size(26, 26),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5,top: 9),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                  textDirection: TextDirection.rtl,

                                  //maxLines: 0,

                                  "${BackEnd.Prodects3[prodects].title.substring(0, 6)}...",
                                  style: Text_Style.getstyle(
                                      fontsize: 16,
                                      ColorText: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                textDirection: TextDirection.rtl,
                                '${BackEnd.Prodects3[prodects].price} ??.?? ',
                                style: Text_Style.getstyle(fontsize: 17, ColorText: Colors.black, fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
/**/
