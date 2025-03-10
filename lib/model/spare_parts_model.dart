import 'package:workshop_app/core/utils/assets.dart';

class SparePartsModel {
  final String image,text;

  SparePartsModel({
    required this.image,
    required this.text,
  });
}

List<SparePartsModel> sparePartsList = [
  SparePartsModel(
      image: AppImages.spareParts1,
      text: "High Quality Drilled and Slotted Brake\n DiscsPort:Qingdao, China",
  ),
  SparePartsModel(
      image: AppImages.spareParts2,
      text: "Car Air Filter K&N\n E-1100 Washable and\n Reusable",
  ),
  SparePartsModel(
      image: AppImages.spareParts3,
      text: "Generic NGK Japanese\n NGK Resistance 16\n Guards Set 2 Candles",
  ),
  SparePartsModel(
      image: AppImages.spareParts4,
      text: "MagnaFlow Exhaust\n Products MagnaFlow\n 14815 Exhaust Muffler",
  ),
  SparePartsModel(
      image: AppImages.spareParts5,
      text: "MagnaFlow Exhaust\n Products MagnaFlow\n 14815 Exhaust Muffler",
  ),
  SparePartsModel(
      image: AppImages.spareParts6,
      text: "MagnaFlow Exhaust\n Products MagnaFlow\n 14815 Exhaust Muffler",
  ),
];