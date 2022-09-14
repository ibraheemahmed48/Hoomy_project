import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import '../../single_prodect/single_prodect_main.dart';
import 'model.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key, required this.prodects}) : super(key: key);
  final Prodect prodects;

  @override
  Widget build(BuildContext context) {
    return
      Obx((){
        return GestureDetector(
          onTap: (){
            prodects.makeAsClicked();
            Get.to(SingleProdect( prodects: prodects,));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18)),
              child:Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child:
                    Container(
                      child: ElevatedButton(
                        onPressed:(){
                          prodects.makeAsFav();
                        },
                        child:prodects.isFav==false? Icon(Ionicons.heart , color: Color.fromRGBO(69, 185, 238, 1)) :  Icon(Ionicons.heart, color: Color(0XFFFF0000)),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0XFFE7E7E7),
                          fixedSize: const Size(26, 26),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                  if(prodects.available == false)
                    Container(
                      width: 150,
                      height: 130,
                      margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                      color: Colors.white,
                      child: Image.asset(Prodect.ImagesList[0])),
                  if(prodects.available == true)
                    Container(
                      width: 150,
                      height: 110,
                      margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                      color: Colors.white,
                      child: Image.asset(Prodect.ImagesList[0])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(prodects.available == false)
                        Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              prodects.addToCart();
                              prodects.deleteFromCart();
                            },
                            child:prodects.add==false? Icon(Ionicons.cart_outline, color: Color.fromRGBO(69, 185, 238, 1)) :  Icon(Ionicons.cart , color:Color.fromRGBO(69, 185, 238, 1)),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Color(0XFFE7E7E7),
                              fixedSize: const Size(26, 26),
                              shape: const CircleBorder(),
                            ),
                          ),
                        ),
                      ),
                      if(prodects.available == true)
                        Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              prodects.addToCart();
                              prodects.deleteFromCart();
                            },
                            child:prodects.add==false? Icon(Ionicons.cart_outline, color: Color.fromRGBO(69, 185, 238, 1)) :  Icon(Ionicons.cart , color:Color.fromRGBO(69, 185, 238, 1)),
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
                             if(prodects.available == true)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'المنتج غير متاح',
                                      style: GoogleFonts.inter(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      prodects.name.value,
                                      style: GoogleFonts.inter(fontSize: 19,color: Colors.black)
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                    'د.ع'+'${prodects.price.value}',
                                    style: GoogleFonts.inter(fontSize: 17,color: Colors.black

                                    )),
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
      },
      );
  }
}
/**/