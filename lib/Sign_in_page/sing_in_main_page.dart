import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:google_fonts/google_fonts.dart';import '../Sign_up_page/text_Field.dart';import '../Sign_up_page/white_logo.dart';class Sign_in_main_page extends StatefulWidget {  Sign_in_main_page({Key? key}) : super(key: key);  @override  State<Sign_in_main_page> createState() => _Sign_in_main_pageState();}class _Sign_in_main_pageState extends State<Sign_in_main_page> {  final TextEditingController email = TextEditingController();  final TextEditingController password = TextEditingController();  bool swich = false;  @override  Widget build(BuildContext context) {    return Scaffold(        // appBar: AppBar(        //     backgroundColor: Color(0xff45B9EE),        //     elevation: 0,        //     title: Hoomy_logo_white()),        backgroundColor: Colors.white,        body: SafeArea(            child: SingleChildScrollView(          child: Center(              child: Column(                  mainAxisAlignment: MainAxisAlignment.start,                  crossAxisAlignment: CrossAxisAlignment.center,                  children: [                Stack(                  children: [                    Image.asset(                      "photo/33.png",                      width: double.infinity,                    ),                    Hoomy_logo_white()                  ],                ),                Padding(                  padding: const EdgeInsets.only(top: 10, bottom: 25),                  child: Text(                    "Welcome",                    style: GoogleFonts.inter(fontSize: 26),                  ),                ),                Padding(                  padding: const EdgeInsets.only(top: 10, bottom: 25),                  child: Text(                    "Sign in to continue",                    style: GoogleFonts.inter(fontSize: 15),                  ),                ),                Text_Field1(                  MyController: email,                  fintText: 'Email',                  icon: Icon((Icons.alternate_email), color: email.text.isEmpty                      ? Colors.black38                      : Color(0xff45B9EE)),                  labelText: 'Email',                  pass: false,                ),                Text_Field1(                  MyController: password,                  fintText: 'Password',                  icon: IconButton(                    icon: Icon(swich == false                        ? Icons.visibility_off                        : Icons.visibility),                      color: password.text.isEmpty                          ? Colors.black38                          : Color(0xff45B9EE),                    onPressed: () {                      setState(() {                        if (swich == false) {                          swich = true;                        } else {                          swich = false;                        }                      });                      print(swich);                    },                  ),                  labelText: 'Password',                  pass: swich,                ),                    Padding(                      padding: const EdgeInsets.symmetric(vertical: 30),                      child: Container(                        width: 340,                        height: 50,                        color: Color(0xff45B9EE),                      ),                    )              ])),        )));  }}