import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:google_fonts/google_fonts.dart';import '../help/text_style.dart';class Text_Field1 extends StatelessWidget {  Text_Field1({    Key? key,    required this.MyController,    required this.hintText,    required this.icon,    required this.labelText,    required this.pass,    required this.onChanged,    this.keyboardType,  }) : super(key: key);  final TextEditingController MyController;  final RxString hintText;  final RxString labelText;  final Widget icon;  final bool pass;  static String text1 = '';  final TextInputType? keyboardType;  final void Function(String)? onChanged;  @override  Widget build(BuildContext context) {    return Padding(      padding: const EdgeInsets.only(bottom: 20),      child: SizedBox(        width: 340,        height: 50,        child: TextFormField(      //       validator: (value) {      // int res =length_check (value!);      // if (res == 1) {      // return "Please enter state";      // } else {      // return null;      // }      // },            textDirection: TextDirection.rtl,            onChanged: (text) {              onChanged!(text);            },            keyboardType: keyboardType,            obscureText: pass,            controller: MyController,            decoration: InputDecoration(                hintTextDirection: TextDirection.rtl,                border: OutlineInputBorder(                  borderRadius: BorderRadius.circular(18),                  borderSide: BorderSide(color: Colors.lightBlue, width: 2),                ),                enabledBorder: OutlineInputBorder(                  borderRadius: BorderRadius.circular(18.0),                  borderSide: BorderSide(                    width: 2,                    color: Colors.black26,                  ),                ),                //errorBorder:InputDecoration.errorText,                prefixIcon: icon,                hintText: " $hintText    ",                hintStyle:Text_Style.getstyle(fontsize: 15, ColorText: Color.fromRGBO(129, 129, 129, 1), fontWeight: FontWeight.w500),                contentPadding: const EdgeInsets.only(top: 10, right: 12)),            onTap: () {}),      ),    );  }}