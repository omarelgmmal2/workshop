import 'package:workshop_app/core/utils/assets.dart';

class OrdersModel {
  final String image, title;
  final double price;

  OrdersModel({required this.image, required this.title, required this.price});
}

List<OrdersModel> ordersList = [
  OrdersModel(
        image: AppImages.spareParts1,
      title: "High Quality Drilled ",
      price: 2.50,
  ),
  OrdersModel(
        image: AppImages.spareParts2,
      title: "Generic NGK Japanese",
      price: 3.20,
  ),
  OrdersModel(
        image: AppImages.spareParts3,
      title: "Car Air Filter",
      price: 5.90,
  ),
  OrdersModel(
        image: AppImages.spareParts4,
      title: "Magnaflow Exhaust",
      price: 4.50,
  ),
];
