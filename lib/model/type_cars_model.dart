import 'package:workshop_app/core/utils/assets.dart';

class TypeCarsModel {
  final String image;

  TypeCarsModel({required this.image});
}

List<TypeCarsModel> typeCarsList = [
  TypeCarsModel(image: AppImages.car1),
  TypeCarsModel(image: AppImages.car2),
  TypeCarsModel(image: AppImages.car3),
  TypeCarsModel(image: AppImages.car2),
];