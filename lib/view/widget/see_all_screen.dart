import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';
import '../../model/spare_parts_model.dart';
import 'custom_top_sell_item_product.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: CustomAppBar(
        title: CustomTextWidget(
          label: "Top Sell",
          style: TextStyleTheme.textStyle20Bold,
        ),
        gradient: LinearGradient(
          colors: [
            AppColor.primary.withOpacity(.86),
            Color(0xffC0FFDA),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 47.h),
        children: [
          GridView.builder(
            itemCount: sparePartsList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 163 / 250,
              mainAxisSpacing: 26,
              crossAxisSpacing: 26,
            ),
              itemBuilder: (context, index) => CustomTopSellItemProduct(model: sparePartsList[index]),
          ),
        ],
      ),
    );
  }
}
