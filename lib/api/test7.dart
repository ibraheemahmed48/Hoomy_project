import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'Api_calls.dart';import 'api_models.dart';class test8 extends StatefulWidget {  const test8({Key? key}) : super(key: key);  @override  State<test8> createState() => _test8State();}var data;class _test8State extends State<test8> {  @override  void initState() {    // TODO: implement initState    super.initState();    BackEnd.Get3();    Future.delayed(const Duration(seconds:4), () {     print(BackEnd.Prodects3[0]);     print(BackEnd.Prodects3[0].banner);    });  }  @override  Widget build(BuildContext context) {    return Scaffold(      body: SafeArea(          child: Column(        children: [          Container(              width: 150,              height: 150,              child:          Image.network("https://zaynhamza.pythonanywhere.com"+BackEnd.Prodects3[0].banner)),        ],      )),    );  }}