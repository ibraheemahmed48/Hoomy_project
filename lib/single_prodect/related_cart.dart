import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoomy_project1/api/api_Url.dart';
import 'package:hoomy_project1/single_prodect/single_prodect_main.dart';
import 'package:ionicons/ionicons.dart';
import '../api/Api_calls.dart';
import '../home/prodects/model.dart';


class RelatedCart extends StatefulWidget {
  const RelatedCart({Key? key, required this.prodects}) : super(key: key);
  final int prodects;

  @override
  State<RelatedCart> createState() => _RelatedCartState();
}

class _RelatedCartState extends State<RelatedCart> {
  @override
  Widget build(BuildContext context) {
    return
          GestureDetector(
      onTap: (){
        //    prodects.makeAsClicked();
            Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                builder: (BuildContext context) =>  SingleProdect(prodects: widget.prodects,)));},

          child: Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,right:20),
            child: Container(
              height: 276,
              width: 198,
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
                              if (BackEnd.Prodects3[widget.prodects].isFav == false)
                                BackEnd.Prodects3[widget.prodects].isFav = true;
                              else
                                BackEnd.Prodects3[widget.prodects].isFav = false;
                              },
                            child: BackEnd.relatidList[widget.prodects].isFav ==false? Icon(Ionicons.heart , color: Color.fromRGBO(69, 185, 238, 1)) :  Icon(Ionicons.heart, color: Color(0XFFFF0000)),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Color(0XFFE7E7E7),
                              fixedSize: const Size(26, 26),
                              shape: const CircleBorder(),
                            ),
                          ),
                        ),
                      ),
                      if( BackEnd.Prodects3[widget.prodects].isAvailable== false)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                              ' ?????? ??????????',
                              style: GoogleFonts.inter(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold)
                          ),
                        ),
                    ],
                  ),
                  Container(
                      width: 180,
                      height: 128,
                      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(ApiConstants.Domain+BackEnd.Prodects3[widget.prodects].banner,fit: BoxFit.cover),
                    ),   ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if( BackEnd.Prodects3[widget.prodects].isAvailable== true)
                        Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          child: ElevatedButton(
                              onPressed: () async {
                                await BackEnd.add_to_card(id: BackEnd.Prodects3[widget.prodects].id);
                            },
                            child:  Icon(Ionicons.cart , color:Color.fromRGBO(69, 185, 238, 1)),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Color(0XFFE7E7E7),
                              fixedSize: const Size(26, 26),
                              shape: const CircleBorder(),
                            ),
                          ),
                        ),
                        ) ,
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      BackEnd.Prodects3[widget.prodects].title,
                                      style: GoogleFonts.inter(fontSize: 19,color: Colors.black)
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                    '??.??'+'${BackEnd.Prodects3[widget.prodects].price}',
                                    style: GoogleFonts.inter(fontSize: 17,color: Colors.black
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]
                    ),
                    ],
                  )
              ),
            ),
          );
  }
}

/**/