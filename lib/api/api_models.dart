// To parse this JSON data, do////     final productModel = productModelFromJson(jsonString);import 'package:meta/meta.dart';import 'dart:convert';List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(    json.decode(str).map((x) => ProductModel.fromJson(x)));String productModelToJson(List<ProductModel> data) =>    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));class ProductModel {  final int? id;  final String? title;  final String? banner;  final String? description;  final Category? category;  final List<Color2>? colors;  final int? price;  final bool? isAvailable;  final bool? showHide;  final bool? isFeatured;  final List<ProductImage>? productImage;  ProductModel({    @required this.id, //    @required this.title, //    @required this.banner,    @required this.description, //    @required this.category, //    @required this.colors, //    @required this.price, //    @required this.isAvailable, //    @required this.showHide,    @required this.isFeatured,    @required this.productImage, //  });  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(        id: json["id"],        title: json["title"],        banner: json["banner"],        description: json["description"],        category: Category.fromJson(json["category"]),        colors:            List<Color2>.from(json["colors"].map((x) => Color2.fromJson(x))),        price: json["price"],        isAvailable: json["is_available"],        showHide: json["show_hide"],        isFeatured: json["is_featured"],        productImage: List<ProductImage>.from(            json["product_image"].map((x) => ProductImage.fromJson(x))),      );  Map<String, dynamic> toJson() => {        "id": id,        "title": title,        "banner": banner,        "description": description,        "category": category!.toJson(),        "colors": List<dynamic>.from(colors!.map((x) => x.toJson())),        "price": price,        "is_available": isAvailable,        "show_hide": showHide,        "is_featured": isFeatured,        "product_image":            List<dynamic>.from(productImage!.map((x) => x.toJson())),      };}class Category {  Category({    @required this.title,  });  final String? title;  factory Category.fromJson(Map<String, dynamic> json) => Category(        title: json["title"],      );  Map<String, dynamic> toJson() => {        "title": title,      };}class Color2 {  Color2({    @required this.colorCode,  });  final String? colorCode;  factory Color2.fromJson(Map<String, dynamic> json) => Color2(        colorCode: json["color_code"],      );  Map<String, dynamic> toJson() => {        "color_code": colorCode,      };}class ProductImage {  ProductImage({    @required this.images,  });  final String? images;  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(        images: json["images"],      );  Map<String, dynamic> toJson() => {        "images": images,      };}