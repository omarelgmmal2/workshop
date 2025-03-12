import 'package:flutter/material.dart';
import 'package:workshop_app/core/utils/app_color.dart';
import 'package:workshop_app/core/utils/assets.dart';

class OrdersModel {
  final String image, title;
  final String? textType;
  final double price;
  final Color? color;
  final Icon? icon;

  OrdersModel({
    required this.image,
    required this.title,
    required this.price,
    this.color,
    this.textType,
    this.icon,
  });
}

List<OrdersModel> ordersList = [
  OrdersModel(
        image: AppImages.spareParts1,
      title: "High Quality Drilled ",
      textType: "Completed",
      price: 2.50,
    color: Color(0xff7AFF76),
    icon: Icon(Icons.done,color: AppColor.black,size: 20,),
  ),
  OrdersModel(
        image: AppImages.spareParts2,
      title: "Generic NGK Japanese",
    textType: "Completed",
    price: 3.20,
    color: Color(0xff7AFF76),
    icon: Icon(Icons.done,color: AppColor.black,size: 20,),
  ),
  OrdersModel(
        image: AppImages.spareParts3,
      title: "Car Air Filter",
    textType: "Waiting",
    price: 5.90,
    color: Color(0xffFDF477),
    icon: Icon(Icons.done,color: AppColor.black,size: 20,),
  ),
  OrdersModel(
        image: AppImages.spareParts4,
      title: "Magnaflow Exhaust",
      textType: "Fail",
      price: 4.50,
    color: Color(0xffFF4C49),
    icon: Icon(Icons.close,color: AppColor.black,size: 20,),
  ),
];
