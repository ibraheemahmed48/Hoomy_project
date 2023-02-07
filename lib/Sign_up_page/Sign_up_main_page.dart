import 'dart:io';import 'package:flutter/gestures.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';import 'package:hoomy_project1/Sign_up_page/text_Field.dart';import 'package:hoomy_project1/Sign_up_page/white_logo.dart';import 'package:hoomy_project1/profile_page/image_name.dart';import 'package:image_picker/image_picker.dart';import 'package:unicons/unicons.dart';import 'package:google_fonts/google_fonts.dart';import 'package:get/get.dart';import '../Sign_in_page/sing_in_main_page.dart';import '../api/Api_calls.dart';import '../api/auth_service/auth.dart';import '../api/auth_service/auth.dart';import '../api/auth_service/auth.dart';import '../api/local_database/shared_preferences.dart';import '../help/text_style.dart';import '../home/catigory_buttons.dart';import '../home/home_main_page.dart';import '../landing/button.dart';import '../profile_page/profile_main_page.dart';class Sign_up_main_page extends StatefulWidget {  @override  Sign_up_main_page({    Key? key,  }) : super(key: key);  @override  State<Sign_up_main_page> createState() => _Sign_up_main_pageState();}class _Sign_up_main_pageState extends State<Sign_up_main_page> {  final TextEditingController firstName = TextEditingController();  final TextEditingController email = TextEditingController();  final TextEditingController password1 = TextEditingController();  final TextEditingController Confirmpassword = TextEditingController();  final TextEditingController secondName = TextEditingController();  RxBool swich = true.obs;  RxBool swich2 = true.obs;  File? image;  final RxBool delay = true.obs;  static final RxString typed_firstName = ''.obs;  static final RxString typed_secondName = ''.obs;  static final RxString typed_email = ''.obs;  static final RxString typed_password1 = ''.obs;  static final RxString typed_Confirmpassword = ''.obs;  @override  Widget build(BuildContext context) {    FlutterStatusbarcolor.setStatusBarColor(Color(0xff45B9EE), animate: true);    return Scaffold(        body: SafeArea(            child: SingleChildScrollView(                child: Column(                    mainAxisAlignment: MainAxisAlignment.start,                    crossAxisAlignment: CrossAxisAlignment.center,                    children: [          Image.asset(            "photo/22.png",            width: double.infinity,          ),          Padding(            padding: const EdgeInsets.only(top: 0, bottom: 15),            child: Text(                textDirection: TextDirection.rtl,                "انشاء حساب",                style: Text_Style.getstyle(                    fontsize: 30,                    ColorText: Colors.black,                    fontWeight: FontWeight.bold)),          ),          Obx(() {            return Text_Field1(              keyboardType: TextInputType.name,              MyController: firstName,              onChanged: (text) {                typed_firstName.value = text;                print(text);              },              hintText: 'الاسم الاول :'.obs,              icon: Icon(                UniconsLine.user,                color: typed_firstName.value.isEmpty                    ? Colors.black38                    : Color(0xff45B9EE),              ),              labelText: "".obs,              pass: false,            );          }),          Obx(() {            return Text_Field1(              keyboardType: TextInputType.name,              MyController: secondName,              onChanged: (text) {                typed_secondName.value = text;                print(text);              },              hintText: 'اسم العائلة :'.obs,              icon: Icon(                UniconsLine.users_alt,                color: typed_secondName.value.isEmpty                    ? Colors.black38                    : Color(0xff45B9EE),              ),              labelText: "".obs,              pass: false,            );          }),          Obx(() {            return Text_Field1(              keyboardType: TextInputType.emailAddress,              MyController: email,              onChanged: (text) {                typed_email.value = text;                print(text);              },              hintText: 'الايميل :'.obs,              icon: Icon((Icons.alternate_email),                  color: typed_email.value.isEmpty                      ? Colors.black38                      : Color(0xff45B9EE)),              labelText: ''.obs,              pass: false,            );          }),          Obx(() {            return Text_Field1(              MyController: password1,              keyboardType: TextInputType.visiblePassword,              onChanged: (text) {                typed_password1.value = text;                print(text);              },              hintText: 'الباسورد :'.obs,              icon: IconButton(                icon: Icon(                    swich == true ? Icons.visibility_off : Icons.visibility),                color: typed_password1.value.isEmpty                    ? Colors.black38                    : Color(0xff45B9EE),                onPressed: () {                  setState(() {                    if (swich == false) {                      swich = true.obs;                    } else {                      swich = false.obs;                    }                  });                  print(swich);                },              ),              labelText: ''.obs,              pass: swich.value,            );          }),          Obx(() {            return Text_Field1(              keyboardType: TextInputType.visiblePassword,              MyController: Confirmpassword,              onChanged: (text) {                typed_Confirmpassword.value = text;                print(text);              },              hintText: 'تأكيد الباسورد :'.obs,              icon: IconButton(                icon: Icon(                    swich2 == true ? Icons.visibility_off : Icons.visibility),                color: typed_Confirmpassword.value.isEmpty                    ? Colors.black38                    : Color(0xff45B9EE),                onPressed: () {                  setState(() {                    if (swich2 == false) {                      swich2 = true.obs;                    } else {                      swich2 = false.obs;                    }                  });                  print(swich2);                },              ),              labelText: ''.obs,              pass: swich2.value,            );          }),          Obx(() {            return Padding(                padding: const EdgeInsets.only(bottom: 0),                child: delay.value == false                    ? CircularProgressIndicator()                    : Button1(                        text: 'انشاء حساب',                        onPressed: () async {                          setState(() {                          });                          await Database2.initStorage();                          print("انشاء حساب");                          delay.value = false;                            print("عاششششششششششششششش");                          AuthService.Sign_up(                              first_name: firstName.text,                              last_name: secondName.text,                              email: email.text,                              password1: password1.text,                              password2: Confirmpassword.text,                              profile_pic: "profile_pic");                          await Future.delayed(const Duration(seconds: 3),                                  () async {                            print("منا استدعيت الفنكشن");                            print("signup_falgs11:${AuthService.signup_falgs}");                            print("res400111:${AuthService.res400}");                            length_check();                                print("Done");                              });                          Future.delayed(const Duration(seconds: 3), () {                            print("Future.delayed ${delay.value}");                            delay.value = true;                          });                        },                      ));          }),          CatigoryButtons(            text: 'تمتلك حساب؟ أنقر لتسجيل الدخول',            onPressed: () {              Get.to(Sign_in_main_page(),                  transition: Transition.noTransition,                  duration: Duration(seconds: 1));            },          ),        ]                )            )        )    );  }  length_check() {    print("منا بدة الفنكسن");    bool flag = false;    if (email.text.length < 8 ||        password1.text.length < 8 ||        Confirmpassword.text.length < 8 ||        firstName.text.isEmpty ||        secondName.text.isEmpty) {        Get.showSnackbar(GetSnackBar(        backgroundColor: Colors.red,        duration: Duration(seconds: 2),        messageText: Text('اقل من 8 احرف ',            textDirection: TextDirection.rtl,            style: Text_Style.getstyle(fontsize: 15, ColorText: Colors.white, fontWeight: FontWeight.w400)),      ));      flag = false;    } else if (password1.text.contains(RegExp(r'[#?!@$%^&*-]'))) {       Get.showSnackbar(GetSnackBar(        backgroundColor: Colors.red,        duration: Duration(seconds: 2),        messageText: Text('كلمة المرور يجب ان لا يحتوي على حروف خاصة  ',            textDirection: TextDirection.rtl,            style: Text_Style.getstyle(fontsize: 15, ColorText: Colors.white, fontWeight: FontWeight.w400)),      ));      flag = false;    } else if (Confirmpassword.text != password1.text) {       Get.showSnackbar(GetSnackBar(        backgroundColor: Colors.red,        duration: Duration(seconds: 2),        messageText: Text('كلمة المرور غي متطابقة',            textDirection: TextDirection.rtl,            style: Text_Style.getstyle(fontsize: 15, ColorText: Colors.white, fontWeight: FontWeight.w400)),      ));      flag = false;    } else if (email.text.contains(RegExp(r'[#?!$%^&*-]'))) {       Get.showSnackbar(GetSnackBar(        backgroundColor: Colors.red,        duration: Duration(seconds: 2),        messageText: Text('الايميل يجب ان لا يحتوي على حروف خاصة ',            textDirection: TextDirection.rtl,            style: Text_Style.getstyle(fontsize: 15, ColorText: Colors.white, fontWeight: FontWeight.w400)),      ));      flag = false;    } else if (!email.text.contains(RegExp(r'@.'))) {       Get.showSnackbar(GetSnackBar(        backgroundColor: Colors.red,        duration: Duration(seconds: 2),        messageText: Text('البريد الالكتروني غير صالح ',            textDirection: TextDirection.rtl,            style: Text_Style.getstyle(fontsize: 15, ColorText: Colors.white, fontWeight: FontWeight.w400)),      ));      flag = false;    }else if (AuthService.res400 == false) {      Get.showSnackbar(GetSnackBar(        backgroundColor: Colors.red,        duration: Duration(seconds: 2),        messageText: Text(AuthService.ers400,            textDirection: TextDirection.rtl,            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),      ));      print("اني وصلت لهنا32 ");    }    else if (AuthService.signup_falgs == false) {      Get.showSnackbar(GetSnackBar(        backgroundColor: Colors.red,        duration: Duration(seconds: 2),        messageText: Text("البريد الالكتروني غير صالح",            textDirection: TextDirection.rtl,            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),      ));      print("اني وصلت لهنا ");    }    else {      flag = true;      print("يابة شسالفة ");    }  }  Future pickImage() async {    try {      final image = await ImagePicker().pickImage(source: ImageSource.gallery);      if (image == null) return;      final imageTemporary = File(image.path);      setState(() => this.image = imageTemporary);    } on PlatformException catch (e) {      print("Failed to pick image : $e");    }  }  Future pickImage_camera() async {    try {      final image = await ImagePicker().pickImage(source: ImageSource.camera);      if (image == null) return;      final imageTemporary = File(image.path);      setState(() => this.image = imageTemporary);    } on PlatformException catch (e) {      print("Failed to pick image : $e");    }  }  void _showDialog(BuildContext context) {    showDialog(      context: context,      builder: (BuildContext context) {        return AlertDialog(          title: Text(            "اختيار الصورة",            textDirection: TextDirection.rtl,          ),          content: Text(            "اختار صورة من : ",            textDirection: TextDirection.rtl,          ),          actions: [            MaterialButton(              child: Row(                mainAxisAlignment: MainAxisAlignment.spaceAround,                children: [                  Container(                      margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),                      width: 100,                      height: 40,                      child: RawMaterialButton(                        onPressed: () async {                          await pickImage();                          Navigator.pop(                            context,                          );                        },                        fillColor: Color.fromRGBO(69, 185, 238, 1),                        shape: RoundedRectangleBorder(                            borderRadius: BorderRadius.circular(30)),                        child: Text(                          "المعرض",                          style: GoogleFonts.inter(                              fontSize: 15,                              color: Colors.black,                              fontWeight: FontWeight.bold),                        ),                      )),                  Container(                      margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),                      width: 100,                      height: 40,                      child: RawMaterialButton(                        onPressed: () async {                          await pickImage_camera();                          Navigator.pop(                            context,                          );                        },                        fillColor: Color.fromRGBO(69, 185, 238, 1),                        shape: RoundedRectangleBorder(                            borderRadius: BorderRadius.circular(18)),                        child: Text(                          "الكامرة",                          style: GoogleFonts.inter(                              fontSize: 15,                              color: Colors.black,                              fontWeight: FontWeight.bold),                        ),                      )),                ],              ),              onPressed: () {                Navigator.of(context).pop();              },            ),          ],        );      },    );  }}