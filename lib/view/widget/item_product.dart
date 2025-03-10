import 'package:flutter/material.dart';
import 'package:workshop_app/model/spare_parts_model.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/text_style_theme.dart';

class ItemProduct extends StatelessWidget {
  final SparePartsModel model;

  const ItemProduct({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppImage(
          model.image,
          fit: BoxFit.cover,
        ),
        CustomTextWidget(
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          label: model.text,
          maxLines: 3,
          style: TextStyleTheme.textStyle10Regular,
        ),
      ],
    );
  }
}
