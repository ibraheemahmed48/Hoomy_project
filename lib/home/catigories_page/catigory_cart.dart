import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoomy_project1/api/api_Url.dart';
import '../../api/Api_calls.dart';
import '../../help/Colors.dart';
import '../../help/text_style.dart';
import '../../my_cart_page/my_cart_list.dart';
import '../../single_prodect/Catigories_single_prodect/Single_main.dart';
import '../../single_prodect/single_prodect_main.dart';
import 'package:ionicons/ionicons.dart';


class CatCart extends StatefulWidget {
  const CatCart({Key? key, required this.prodects}) : super(key: key);

  final int prodects;

  @override
  State<CatCart> createState() => _CatCartState();
}

class _CatCartState extends State<CatCart> {
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          //    prodects.makeAsClicked();
          Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => SingleProdectCat(
                    prodects: widget.prodects,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: Color(0XFFE1F8FF),
                borderRadius: BorderRadius.circular(18)),
            child:Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:
                      Container(
                        child: ElevatedButton(
                          onPressed:(){
                            setState(() {});
                            if (BackEnd.categoryList[widget.prodects].isFav == false)
                              BackEnd.categoryList[widget.prodects].isFav = true;
                            else
                              BackEnd.categoryList[widget.prodects].isFav = false;
                          },
                          child:BackEnd.categoryList[widget.prodects].isFav==false? Icon(Ionicons.heart , color: Colorsapp.mainColor) :  Icon(Ionicons.heart, color: Color(0XFFFF0000)),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            fixedSize: const Size(26, 26),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                    ),
                    if(BackEnd.categoryList[widget.prodects].isAvailable==false)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                            ' غير متوفر',
                            style: Text_Style.getstyle(fontsize: 14, ColorText: Colors.red, fontWeight: FontWeight.w600)
                        ),
                      ),
                  ],
                ),
                Container(
                  // width: 180,
                  height: 128,
                  width:MediaQuery.of(context).size.width-50 ,
                  margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(ApiConstants.Domain+BackEnd.categoryList[widget.prodects].productImage[0].image,fit: BoxFit.contain),
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if(BackEnd.categoryList[widget.prodects].isAvailable==true)
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});

                              print(BackEnd.categoryList[widget.prodects].inCart);

                              if (BackEnd.categoryList[widget.prodects].inCart == false){
                                BackEnd.categoryList[widget.prodects].inCart = true;
                                BackEnd.categoryList[widget.prodects].quantity = 1;
                                MyCardsList.cartList.add(BackEnd.categoryList[widget.prodects]);
                              }
                              else{
                                BackEnd.categoryList[widget.prodects].inCart = false;
                                MyCardsList.cartList.remove(BackEnd.categoryList[widget.prodects]);
                              }

                            },
                            child:BackEnd.categoryList[widget.prodects].inCart == false
                                ?
                            Icon(Ionicons.cart_outline , color:Color.fromRGBO(69, 185, 238, 1)):
                            Icon(Ionicons.cart , color:Color.fromRGBO(69, 185, 238, 1)),                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              fixedSize: const Size(26, 26),
                              shape: const CircleBorder(),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12,top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    textDirection: TextDirection.rtl,

                                    "${BackEnd.categoryList[widget.prodects].title.substring(0,BackEnd.categoryList[widget.prodects].title.toString().length>8?8:BackEnd.categoryList[widget.prodects].title.toString().length)}...",
                                    style:Text_Style.getstyle(
                                        fontsize: 16,
                                        ColorText: Colors.black,
                                        fontWeight: FontWeight.w500)
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                  textDirection: TextDirection.rtl,

                                  '${BackEnd.categoryList[widget.prodects].price} د.ع ',
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
        ),);
  }
}
/**/