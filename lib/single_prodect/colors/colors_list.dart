import 'package:flutter/cupertino.dart';
import 'package:hoomy_project1/home/prodects/model.dart';
import 'package:hoomy_project1/single_prodect/colors/prodect_colors.dart';

import '../../api/Api_calls.dart';


class ColorList extends StatelessWidget {
  const ColorList({Key? key, required this.prodect}) : super(key: key);
  final int prodect;
  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:BackEnd.Prodects3[prodect].colors.length,
        itemBuilder: (BuildContext context, int index) {
            return ProdectColors( p:prodect,color: index,);
        },
      );
  }
}
